# Zero-Touch CI/CD Pipeline 🚀

Welcome to my DevOps portfolio project! This repository demonstrates a complete, professional-grade Continuous Integration and Continuous Deployment (CI/CD) pipeline built with **Docker**, **GitHub Actions**, **Trivy (DevSecOps)**, and **Terraform (IaC)**.

## 🌟 The Project

This project features a visually stunning "Server Status Dashboard" (Node.js + Express). However, the real magic happens behind the scenes. The goal of this project is to showcase how modern software is delivered efficiently and safely without manual intervention (Zero-Touch).

## 🛠️ DevOps Architecture

1. **Source Control (Git/GitHub):** All code changes are version-controlled here.
2. **Continuous Integration (GitHub Actions & Jest):** Whenever code is pushed, GitHub Actions automatically spins up an environment and runs automated unit tests (`npm test`) to ensure the new code hasn't broken anything.
3. **Containerization (Docker):** Once tests pass, the application is packaged into an isolated, lightweight Docker container. This ensures that "it works on my machine" translates to "it works everywhere".
4. **DevSecOps (Trivy Scan):** Security is a top priority! The pipeline uses **Trivy** to automatically scan the newly built Docker image for OS vulnerabilities and CVEs. If a critical vulnerability is found, the pipeline stops.
5. **Infrastructure as Code (Terraform):** Instead of manually clicking through cloud consoles, the `terraform/` folder contains scripts to automatically provision a secure AWS EC2 instance (including Security Groups) ready to run our Docker container.
6. **Continuous Deployment (Simulation):** The pipeline completes by verifying the secure Docker image is ready for deployment to the Terraform-provisioned environment.

## 🚀 How to Run Locally

If you want to test the application on your local machine:

### Prerequisites
- Node.js (v18+)
- Docker (optional, for container testing)

### Steps (Without Docker)
1. Clone the repository: `git clone <your-repo-url>`
2. Navigate to the folder: `cd zero-touch-pipeline`
3. Install dependencies: `npm install`
4. Run the server: `npm start`
5. Open your browser and go to `http://localhost:3000`

### Steps (With Docker)
1. Build the image: `docker build -t my-zero-touch-app .`
2. Run the container: `docker run -p 3000:3000 my-zero-touch-app`
3. Open your browser and go to `http://localhost:3000`

## 👨‍💻 About Me
I am a passionate fresher stepping into the world of DevOps. I love automating things, containerizing applications, and building reliable delivery pipelines.

---
*Built with ❤️ to demonstrate DevOps fundamentals.*
