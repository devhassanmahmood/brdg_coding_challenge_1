# Copy API

1. ``/copy`` This API endpoint will return all the copy in JSON format.
2. ``/copy?since=1663854300`` This endpoint will return only copy that are changed after value of ``since`` parameter in JSON format.
3. ``/copy/refresh`` API endpoint fetches latest copy data from airtable and updates the copy data without needing restart the backend server.
4. ``/copy/{key}`` It will returns the correct value associated with the key. This endpoint will work with Copy keys that are added later without needing to change the backend code.

