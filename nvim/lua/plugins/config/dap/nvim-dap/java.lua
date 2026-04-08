local dap = require('dap')

dap.adapters.java = function(callback)
  callback({
    type = 'server';
    host = '127.0.0.1';
    port = 5005;
  })
end
