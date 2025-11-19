# Sandbox Repository - SAInapse CI/CD Integration

This is a simple Python project demonstrating integration with SAInapse's automated test result tracking.

## 📋 Project Structure

```
sandbox-repo/
├── calculator.py           # Simple calculator module
├── test_calculator.py      # Unit tests with pytest
├── requirements.txt        # Python dependencies
├── pytest.ini             # Pytest configuration
├── .github/
│   └── workflows/
│       └── sainapse-tests.yml  # GitHub Actions workflow
└── README.md              # This file
```

## 🚀 Quick Start

### Local Development

```bash
# Install dependencies
pip install -r requirements.txt

# Run tests
pytest

# Run tests with coverage
pytest --cov=calculator --cov-report=term-missing

# Run tests and generate JSON report
pytest --json-report --json-report-file=test-results.json
```

## 🔄 CI/CD Integration

This project automatically runs tests and uploads results to SAInapse on every push and pull request.

### GitHub Actions Workflow

The workflow (`sainapse-tests.yml`) does the following:

1. **Setup**: Checkout code, install Python 3.11, install dependencies
2. **Test**: Run pytest with coverage and JSON reporting
3. **Parse**: Extract metrics (total tests, passed/failed, duration, coverage)
4. **Upload**: Send test results to SAInapse API endpoint
5. **Report**: Display dashboard URL for viewing results

### Required Secrets

Add these to your GitHub repository secrets:

- `SAINAPSE_API_URL`: Your SAInapse API endpoint (e.g., `https://api.sainapse.com`)

### Environment Variables

- `SAINAPSE_PROJECT_ID`: Set to your project ID (default: `ALP`)

## 📊 Test Results

After each test run, results are automatically uploaded to SAInapse and linked to:
- **Pull Requests**: Via PR number extraction
- **JIRA Issues**: Via branch name pattern (e.g., `feature/ALP-123-login`)
- **Git Commits**: Via SHA tracking

View your test results in the SAInapse dashboard:
```
https://sainapse.com/projects/ALP/quality/tests
```

## 🧪 Test Coverage

Current modules:
- ✅ Addition (`add`)
- ✅ Subtraction (`subtract`)
- ✅ Multiplication (`multiply`)
- ✅ Division (`divide`)
- ✅ Power (`power`)

All functions have comprehensive unit tests with edge cases.

## 📈 Metrics Tracked

- **Total Tests**: Number of test cases executed
- **Pass Rate**: Percentage of tests passing
- **Failures**: Count and details of failed tests
- **Duration**: Test execution time in seconds
- **Coverage**: Code coverage percentage

## 🔗 Integration Details

### Test Result Format

The workflow sends test results in this format:

```json
{
  "project_id": "ALP",
  "repository": "owner/repo",
  "branch": "feature/ALP-123-login",
  "pr_number": 42,
  "commit_sha": "abc123...",
  "test_results_file": "{\"total_tests\": 18, \"passed\": 18, ...}",
  "test_format": "pytest"
}
```

### JIRA Issue Linking

If your branch name contains a JIRA issue key (e.g., `feature/ALP-123-login`), the test results will automatically be linked to that issue.

### DevIntelligence Integration

Test results are linked to DevIntelligence instructions for automatic verification of completed tasks.

## 🛠️ Customization

### Change Project ID

Edit `.github/workflows/sainapse-tests.yml`:

```yaml
env:
  SAINAPSE_PROJECT_ID: "YOUR_PROJECT_ID"
```

### Modify Test Configuration

Edit `pytest.ini` to adjust pytest settings:

```ini
[pytest]
addopts = 
    -v
    --cov=calculator
    --cov-report=term-missing
```

## 📝 Example Usage

```python
from calculator import add, divide

# Simple operations
result = add(5, 3)  # 8
quotient = divide(10, 2)  # 5.0
```

## 🐛 Troubleshooting

### Tests not uploading to SAInapse

1. Check that `SAINAPSE_API_URL` secret is set correctly
2. Verify the API endpoint is accessible from GitHub Actions
3. Check workflow logs for detailed error messages

### Coverage not showing

Ensure `pytest-cov` is installed:
```bash
pip install pytest-cov
```

## 🤝 Contributing

This is a sandbox project for testing SAInapse integration. Feel free to add more test cases or modules!

## 📄 License

MIT License - Free to use for testing purposes.

