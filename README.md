# Expense Tracker (MERN)

> A full-stack expense tracking application built with the MERN stack (MongoDB, Express.js, React.js, Node.js) and Docker.

## Features

- Add, view, edit, and delete transactions
- Track income and expenses
- Responsive design
- Docker support for easy deployment

## Prerequisites

- Node.js (v14 or higher)
- npm or yarn
- Docker and Docker Compose (for containerized deployment)
- MongoDB (or use the Dockerized version included)

## Docker Setup

### Prerequisites
- Docker
- Docker Compose

### Development with Docker

1. Build and start the development containers:
   ```bash
   docker-compose -f docker-compose.dev.yml up --build
   ```
   - Frontend will be available at: http://localhost:3000
   - Backend API will be at: http://localhost:9000

### Production with Docker

1. Build and start the production containers:
   ```bash
   docker-compose up --build -d
   ```
   - The application will be available at: http://localhost:9000

### Docker Commands

- Stop all containers:
  ```bash
  docker-compose down
  ```

- View running containers:
  ```bash
  docker ps
  ```

- View logs:
  ```bash
  docker-compose logs -f
  ```

## Project Structure

```
.
├── client/                 # React frontend
├── config/                # Configuration files
├── controllers/           # Route controllers
├── models/                # MongoDB models
├── routes/                # API routes
├── .env                   # Environment variables
├── .dockerignore          # Docker ignore file
├── Dockerfile             # Production Dockerfile
├── Dockerfile.dev         # Development Dockerfile
├── docker-compose.yml     # Production Docker Compose
├── package.json           # Backend dependencies
└── server.js              # Express server
```

## Contributing

1. Fork the repository
2. Create a new branch for your feature
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request
