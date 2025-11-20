# 🚀 Quick Start Guide - Sandbox Repository

## ✅ What's Included

```
sandbox-repo/
├── calculator.py                    # 5 calculator functions
├── test_calculator.py               # 15 unit tests (100% passing!)
├── requirements.txt                 # pytest + coverage plugins
├── pytest.ini                       # pytest configuration
├── .gitignore                       # Python gitignore
├── setup.sh                         # Setup script
├── README.md                        # Full documentation
├── QUICKSTART.md                    # This file
└── .github/workflows/
    └── sainapse-tests.yml          # GitHub Actions workflow
```

## 🧪 Local Testing

### Option 1: Quick Test (No setup)
```bash
cd sandbox-repo
python3 -m pytest test_calculator.py -v
```

### Option 2: Full Setup with Coverage
```bash
cd sandbox-repo
./setup.sh              # Sets up venv + installs deps
source venv/bin/activate
pytest --cov=calculator --cov-report=term-missing
```

**Expected Output:**
```
============================== test session starts ==============================
15 passed in 0.02s
```

## 🔄 GitHub Actions Setup

### 1. Push to GitHub

```bash
cd sandbox-repo
git init
git add .
git commit -m "Initial commit: SAInapse test integration"
git branch -M main
git remote add origin https://github.com/YOUR_ORG/sandbox-repo.git
git push -u origin main
```

### 2. Add GitHub Secrets

Go to: `Settings` → `Secrets and variables` → `Actions` → `New repository secret`

Add:
- **Name:** `SAINAPSE_API_URL`
- **Value:** `http://sainapse-mcp-backend-alb-dev-1263197016.us-east-1.elb.amazonaws.com`
  
  (Or your production URL: `https://api.sainapse.com`)

### 3. Create a Test Branch

```bash
git checkout -b feature/ALP-123-test-integration
echo "# Test change" >> README.md
git add README.md
git commit -m "Test SAInapse integration"
git push origin feature/ALP-123-test-integration
```

### 4. Create Pull Request

- Go to GitHub
- Create PR from `feature/ALP-123-test-integration` to `main`
- Watch the workflow run! 🎉

## 📊 What Happens Next

1. **GitHub Actions triggers** on PR creation
2. **Tests run** (all 15 should pass)
3. **Results upload** to SAInapse API
4. **JIRA issue linked** (ALP-123 from branch name)
5. **Dashboard updated** with test metrics

## 🔍 View Results

After the workflow runs, check:

### GitHub Actions
```
Your Repo → Actions → SAInapse Unit Tests
```

### SAInapse Dashboard
```
https://sainapse.com/projects/ALP/quality
```

### S3 Data Path
```
s3://sainapse-lake/projects/alp/qn/2025/11/19/pr-42-20251119123456.json
```
(Or `pr-5234-...json` if no PR number - uses branch name hash)

### Expected Data in SAInapse
```json
{
  "project_id": "ALP",
  "repository": "YOUR_ORG/sandbox-repo",
  "branch": "feature/ALP-123-test-integration",
  "issue_key": "ALP-123",
  "metrics": {
    "total_tests": 15,
    "passed": 15,
    "failed": 0,
    "skipped": 0,
    "coverage_percent": 100.0
  }
}
```

## 🎯 Test the Workflow

### Success Case (All tests pass)
```bash
# Current state - all tests pass ✅
git push origin feature/ALP-123-test-integration
```

### Failure Case (Introduce a bug)
```bash
# Edit calculator.py - introduce a bug
echo "def add(a, b): return a - b  # BUG!" >> calculator.py

# Commit and push
git add calculator.py
git commit -m "Introduce bug for testing"
git push origin feature/ALP-123-test-integration

# Workflow will fail ❌
# Results still upload to SAInapse with failure metrics
```

## 🛠️ Customization

### Change Project ID

Edit `.github/workflows/sainapse-tests.yml`:
```yaml
env:
  SAINAPSE_PROJECT_ID: "YOUR_PROJECT_ID"  # Change from ALP
```

### Add More Tests

Add to `test_calculator.py`:
```python
def test_new_feature():
    assert new_function() == expected_result
```

### Support Different Test Formats

The workflow supports:
- ✅ **pytest** (current)
- ✅ **unittest** (modify workflow)
- ✅ **nose2** (modify workflow)

## 📝 Key Files Explained

### `sainapse-tests.yml` - GitHub Actions Workflow
- **Trigger:** On push/PR to `main` or `develop`
- **Steps:** Checkout → Setup Python → Install deps → Run tests → Upload to SAInapse
- **Key Features:**
  - Extracts test metrics from pytest JSON
  - Parses coverage from coverage.json
  - Uploads to SAInapse API
  - Fails if tests fail

### `calculator.py` - Sample Module
- 5 simple functions (add, subtract, multiply, divide, power)
- Type hints for better IDE support
- Docstrings for documentation

### `test_calculator.py` - Unit Tests
- 15 comprehensive tests
- Organized in classes by function
- Tests edge cases (negative numbers, zero division, etc.)

## 🚨 Troubleshooting

### Workflow fails with "Network error"
- Check that `SAINAPSE_API_URL` secret is set correctly
- Verify the SAInapse API is accessible

### Tests pass locally but fail in CI
- Check Python version (workflow uses 3.11)
- Ensure all dependencies are in `requirements.txt`

### Results not showing in SAInapse dashboard
- Verify the `SAINAPSE_PROJECT_ID` matches your project
- Check API logs for upload errors
- Ensure branch name contains JIRA issue key (e.g., `feature/ALP-123-*`)

## 🎉 Success Indicators

You'll know it's working when you see:

1. ✅ Green checkmark on GitHub PR
2. 📊 Test metrics in SAInapse dashboard
3. 🔗 Link from SAInapse to GitHub commit
4. ✨ JIRA issue ALP-123 shows test status

## 📞 Need Help?

- Check workflow logs in GitHub Actions
- Review SAInapse API logs
- Verify all secrets are set correctly
- Test API endpoint manually with curl

## 🎓 Next Steps

1. ✅ Run tests locally
2. ✅ Push to GitHub
3. ✅ Add secrets
4. ✅ Create PR
5. ✅ Watch magic happen! 🪄

---

**Ready to go!** 🚀 This sandbox is fully configured and tested.

