"""Minimal sample API for the IDP golden path demonstration."""
from http.server import BaseHTTPRequestHandler, HTTPServer
import json
import os
import time

STARTED_AT = time.time()

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path in ("/healthz", "/readyz"):
            payload = {"status": "ok"}
            self.send_response(200)
        elif self.path == "/":
            payload = {
                "service": "idp-sample-service",
                "message": "Hello from the platform golden path",
                "uptime_seconds": round(time.time() - STARTED_AT, 2),
            }
            self.send_response(200)
        elif self.path == "/metrics":
            payload = None
            body = (
                "# HELP idp_sample_up Service process is running\n"
                "# TYPE idp_sample_up gauge\n"
                "idp_sample_up 1\n"
                "# HELP idp_sample_uptime_seconds Process uptime in seconds\n"
                "# TYPE idp_sample_uptime_seconds gauge\n"
                f"idp_sample_uptime_seconds {time.time() - STARTED_AT:.2f}\n"
            ).encode()
            self.send_response(200)
            self.send_header("Content-Type", "text/plain; version=0.0.4")
            self.send_header("Content-Length", str(len(body)))
            self.end_headers()
            self.wfile.write(body)
            return
        else:
            payload = {"error": "not_found"}
            self.send_response(404)
        body = json.dumps(payload).encode()
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def log_message(self, fmt, *args):
        print(json.dumps({"level": "info", "message": fmt % args}), flush=True)

if __name__ == "__main__":
    port = int(os.getenv("PORT", "8080"))
    HTTPServer(("0.0.0.0", port), Handler).serve_forever()
