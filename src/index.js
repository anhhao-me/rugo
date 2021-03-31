const path = require('path');

const config = require('../lib/api/config');

config.apiURL = `http://localhost:${config.port}`;

;(async () => {
  const Api = await require('../lib/api')(config);
  const View = require('../lib/view')(config);

  View.use('/admin', path.join(__dirname, '../lib/admin/dist'));
  View.use('/admin/(.*)', path.join(__dirname, '../lib/admin/dist/index.html'));
  View.use(path.join(__dirname, '../storage/files/public'));
  View.use('/api', async (_, req, res) => {
    req.url = req.url.replace(/^\/api(.*)$/gm, '$1');
    Api.server.app.callback()(req, res);
    return true;
  });

  View.listen();
})();