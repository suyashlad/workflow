name: LinkedIn Job Scraper

on:
  push:
    branches:
      - main
  workflow_dispatch:  # Allows manual triggering from GitHub UI

jobs:
  run_scraper:
    runs-on: ubuntu-latest  # You can change the OS as needed

    steps:
      # Checkout code
      - name: Checkout repository
        uses: actions/checkout@v2

      # Set up Python
      - name: Set up Python
        uses: actions/setup-python@v2
        with:
          python-version: '3.x'  # Specify the version of Python

      # Install dependencies
      - name: Install dependencies
        run: |
          pip install selenium pandas

      # Add WebDriver
      - name: Download ChromeDriver
        run: |
          wget https://chromedriver.storage.googleapis.com/114.0.5735.90/chromedriver_linux64.zip
          unzip chromedriver_linux64.zip
          chmod +x chromedriver
          mv chromedriver /usr/local/bin/

      # Run the Python script
      - name: Run LinkedIn Scraper
        run: python3 linkedin_scraper.py  # Replace with your Python file name
