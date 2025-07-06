const express = require('express');
const { spawn } = require('child_process');
const os = require('os');

const app = express();
let mcStarted = false;

app.get('/', (req, res) => {
    if (!mcStarted) {
        console.log("Starting Minecraft...");
        if (os.platform() === 'win32') {
            spawn('cmd.exe', ['/c', 'start.bat'], {
                detached: true,
                stdio: 'ignore',
            }).unref();
        } else {
            spawn('bash', ['./start.sh'], {
                detached: true,
                stdio: 'ignore',
            }).unref();
        }
        mcStarted = true;
    }
    res.send('Minecraft server is running (or starting)');
});

const PORT = process.env.PORT || 80;
app.listen(PORT, () => {
    console.log(`Proxy server is running on port ${PORT}`);
});
