const request = require('supertest');
const app = require('../src/server');

describe('API Health Endpoint', () => {
    it('should return 200 OK and a success message', async () => {
        const response = await request(app).get('/api/health');
        expect(response.statusCode).toBe(200);
        expect(response.body).toHaveProperty('status', 'OK');
        expect(response.body).toHaveProperty('message', 'Server is running smoothly');
    });
});

describe('Static File Server', () => {
    it('should serve the index.html on root path', async () => {
        const response = await request(app).get('/');
        expect(response.statusCode).toBe(200);
        expect(response.text).toContain('Mission Control');
    });
});
