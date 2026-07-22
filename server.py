import http.server
import socketserver
import os

PORT = 8000

class MyHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('Cross-Origin-Opener-Policy', 'same-origin')
        self.send_header('Cross-Origin-Embedder-Policy', 'require-corp')
        super().end_headers()
    
    def guess_type(self, path):
        ext = os.path.splitext(path)[1].lower()
        if ext == '.mjs':
            return 'text/javascript'
        if ext == '.bcmap':
            return 'application/octet-stream'
        return super().guess_type(path)

os.chdir(os.path.dirname(os.path.abspath(__file__)))

with socketserver.TCPServer(("", PORT), MyHTTPRequestHandler) as httpd:
    print(f"Server running on http://localhost:{PORT}")
    httpd.serve_forever()