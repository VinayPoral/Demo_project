<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DevOps Interactive Dashboard</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      background-color: #f0f2f5;
    }
    .header {
      padding: 20px;
      background-color: #007bff;
      color: white;
      text-align: center;
    }
    .dashboard {
      display: flex;
      flex-wrap: wrap;
      padding: 20px;
      gap: 20px;
      justify-content: center;
    }
    .card {
      background-color: white;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      width: 250px;
      text-align: center;
    }
    .card h2 {
      color: #007bff;
    }
    .refresh-btn {
      margin-top: 20px;
      padding: 10px 15px;
      background-color: #28a745;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    .refresh-btn:hover {
      background-color: #218838;
    }
  </style>
</head>
<body>

  <div class="header">
    <h1>DevOps Dashboard</h1>
    <p>Live insights into deployment, server health, and performance metrics</p>
  </div>

  <div class="dashboard">
    <div class="card">
      <h2>Deployments</h2>
      <p id="deployments">Loading...</p>
    </div>
    <div class="card">
      <h2>Server Health</h2>
      <p id="serverHealth">Loading...</p>
    </div>
    <div class="card">
      <h2>CPU Usage</h2>
      <p id="cpuUsage">Loading...</p>
    </div>
    <div class="card">
      <h2>Memory Usage</h2>
      <p id="memoryUsage">Loading...</p>
    </div>
  </div>

  <div style="text-align: center; margin: 20px;">
    <button class="refresh-btn" onclick="refreshData()">Refresh Data</button>
  </div>

  <script>
    // Placeholder function to simulate fetching live data
    function fetchData() {
      return {
        deployments: Math.floor(Math.random() * 100),
        serverHealth: Math.floor(Math.random() * 100) + "%",
        cpuUsage: Math.floor(Math.random() * 100) + "%",
        memoryUsage: Math.floor(Math.random() * 100) + "%"
      };
    }

    // Function to update the dashboard with new data
    function refreshData() {
      const data = fetchData();
      document.getElementById('deployments').innerText = data.deployments;
      document.getElementById('serverHealth').innerText = data.serverHealth;
      document.getElementById('cpuUsage').innerText = data.cpuUsage;
      document.getElementById('memoryUsage').innerText = data.memoryUsage;
    }

    // Initial data load
    window.onload = refreshData;
  </script>

</body>
</html>
