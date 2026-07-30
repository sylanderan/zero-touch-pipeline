const express = require('express');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

// Serve static files from the 'public' directory
app.use(express.static(path.join(__dirname, '../public')));

// Simple API endpoint for health check (useful for tests)
app.get('/api/health', (req, res) => {
    res.status(200).json({ status: 'OK', message: 'Server is running smoothly' });
});

// For testing purposes, we export the app without listening if imported as a module
if (require.main === module) {
    app.listen(PORT, () => {
        console.log(`Server is running on http://localhost:${PORT}`);
    });
}

module.exports = app;
