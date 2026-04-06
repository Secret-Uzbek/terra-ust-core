#!/bin/bash
# =================================================================
# TERRA UST - FMP CORE QUICK DEPLOY SCRIPT
# =================================================================
# Author: Abdurashid Abdukarimov
# Date: February 14, 2026
# Purpose: One-command deployment of FMP Core to terra-ust-autobuild
# =================================================================

set -e  # Exit on error

echo "рџљЂ TERRA UST - FMP CORE DEPLOYMENT"
echo "=================================="
echo ""

# Check if we're in the right directory
if [ ! -f "CITATION.cff" ]; then
    echo "вќЊ Error: Not in terra-ust-autobuild directory"
    echo "Please run this script from the root of your repo"
    exit 1
fi

echo "вњ… Detected terra-ust-autobuild repository"
echo ""

# Backup old index.html
echo "рџ“¦ Creating backup..."
if [ -f "index.html" ]; then
    cp index.html index.html.backup.$(date +%Y%m%d-%H%M%S)
    echo "вњ… Backed up to: index.html.backup.$(date +%Y%m%d-%H%M%S)"
fi

# Copy new FMP Core index.html
echo ""
echo "рџ”„ Installing FMP Core version..."
if [ -f "../terra-ust-integration/index.html" ]; then
    cp ../terra-ust-integration/index.html index.html
    echo "вњ… FMP Core index.html installed"
else
    echo "вќЊ Error: FMP Core files not found"
    echo "Please ensure terra-ust-integration folder exists"
    exit 1
fi

# Create data directory for future corpus
echo ""
echo "рџ“Ѓ Creating directory structure..."
mkdir -p data
mkdir -p api
mkdir -p scripts
echo "вњ… Directories created"

# Update README
echo ""
echo "рџ“ќ Updating README..."
cat > README.md << 'EOF'
# terra-ust-autobuild

**Terra Universal Semantic Translator**  
Powered by Fractal Metascience Paradigm (FMP)

## рџљЂ Status
- **Version:** 2.0.0-fmp
- **Engine:** FMP Core (SemanticQuark)
- **Deployment:** GitHub Pages (auto)
- **Live:** https://secret-uzbek.github.io/terra-ust-autobuild/

## рџ”Ґ What's New
- вњ… FMP Core Translation Engine integrated
- вњ… Semantic quarks + fractal coherence
- вњ… Real-time metrics display
- вњ… 10-word vocabulary (expandable)
- вњ… Auto language detection (uz/ru/en/de)

## рџ“љ Corpora
- uzbekcorpus.uz (pending integration)
- German corpus lexicography (pending)
- Navoi texts - 26 works (Chagatai в†’ Uzbek)

## рџ› пёЏ Local Development
```bash
python3 -m http.server 8000
# Visit: http://localhost:8000
```

## рџ“ћ Contact
**Author:** Abdurashid Abdukarimov  
**Email:** a.abdukarimov@fractal-metascience.org  
**ORCID:** 0009-0000-6394-4912

---
*Built with FMP | SemanticQuark Engine v0.1*
EOF
echo "вњ… README updated"

# Git status
echo ""
echo "рџ“Љ Git status:"
git status --short

# Ask for deployment
echo ""
echo "в•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђ"
echo "рџЋЇ READY TO DEPLOY"
echo "в•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђ"
echo ""
echo "Next steps:"
echo "1. Review changes: git diff index.html"
echo "2. Test locally: python3 -m http.server 8000"
echo "3. Deploy: git add . && git commit -m 'рџљЂ Integrate FMP Core v0.1' && git push"
echo ""
read -p "Deploy now? (y/n) " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "рџљЂ Deploying to GitHub Pages..."
    git add .
    git commit -m "рџљЂ Integrate FMP Core v0.1 - SemanticQuark translation engine"
    git push origin main
    echo ""
    echo "вњ… DEPLOYED!"
    echo ""
    echo "Your site will be live in ~1 minute at:"
    echo "https://secret-uzbek.github.io/terra-ust-autobuild/"
    echo ""
else
    echo "вЏёпёЏ  Deployment cancelled"
    echo "Run manually: git add . && git commit && git push"
fi

echo ""
echo "в•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђ"
echo "вњ… INTEGRATION COMPLETE"
echo "в•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђв•ђ"
