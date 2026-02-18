#!/bin/bash
# =================================================================
# TERRA UST - FMP CORE QUICK DEPLOY SCRIPT
# =================================================================
# Author: Abdurashid Abdukarimov
# Date: February 14, 2026
# Purpose: One-command deployment of FMP Core to terra-ust-autobuild
# =================================================================

set -e  # Exit on error

echo "🚀 TERRA UST - FMP CORE DEPLOYMENT"
echo "=================================="
echo ""

# Check if we're in the right directory
if [ ! -f "CITATION.cff" ]; then
    echo "❌ Error: Not in terra-ust-autobuild directory"
    echo "Please run this script from the root of your repo"
    exit 1
fi

echo "✅ Detected terra-ust-autobuild repository"
echo ""

# Backup old index.html
echo "📦 Creating backup..."
if [ -f "index.html" ]; then
    cp index.html index.html.backup.$(date +%Y%m%d-%H%M%S)
    echo "✅ Backed up to: index.html.backup.$(date +%Y%m%d-%H%M%S)"
fi

# Copy new FMP Core index.html
echo ""
echo "🔄 Installing FMP Core version..."
if [ -f "../terra-ust-integration/index.html" ]; then
    cp ../terra-ust-integration/index.html index.html
    echo "✅ FMP Core index.html installed"
else
    echo "❌ Error: FMP Core files not found"
    echo "Please ensure terra-ust-integration folder exists"
    exit 1
fi

# Create data directory for future corpus
echo ""
echo "📁 Creating directory structure..."
mkdir -p data
mkdir -p api
mkdir -p scripts
echo "✅ Directories created"

# Update README
echo ""
echo "📝 Updating README..."
cat > README.md << 'EOF'
# terra-ust-autobuild

**Terra Universal Semantic Translator**  
Powered by Fractal Metascience Paradigm (FMP)

## 🚀 Status
- **Version:** 2.0.0-fmp
- **Engine:** FMP Core (SemanticQuark)
- **Deployment:** GitHub Pages (auto)
- **Live:** https://secret-uzbek.github.io/terra-ust-autobuild/

## 🔥 What's New
- ✅ FMP Core Translation Engine integrated
- ✅ Semantic quarks + fractal coherence
- ✅ Real-time metrics display
- ✅ 10-word vocabulary (expandable)
- ✅ Auto language detection (uz/ru/en/de)

## 📚 Corpora
- uzbekcorpus.uz (pending integration)
- German corpus lexicography (pending)
- Navoi texts - 26 works (Chagatai → Uzbek)

## 🛠️ Local Development
```bash
python3 -m http.server 8000
# Visit: http://localhost:8000
```

## 📞 Contact
**Author:** Abdurashid Abdukarimov  
**Email:** a.abdukarimov@fractal-metascience.org  
**ORCID:** 0009-0000-6394-4912

---
*Built with FMP | SemanticQuark Engine v0.1*
EOF
echo "✅ README updated"

# Git status
echo ""
echo "📊 Git status:"
git status --short

# Ask for deployment
echo ""
echo "═══════════════════════════════════════════════"
echo "🎯 READY TO DEPLOY"
echo "═══════════════════════════════════════════════"
echo ""
echo "Next steps:"
echo "1. Review changes: git diff index.html"
echo "2. Test locally: python3 -m http.server 8000"
echo "3. Deploy: git add . && git commit -m '🚀 Integrate FMP Core v0.1' && git push"
echo ""
read -p "Deploy now? (y/n) " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "🚀 Deploying to GitHub Pages..."
    git add .
    git commit -m "🚀 Integrate FMP Core v0.1 - SemanticQuark translation engine"
    git push origin main
    echo ""
    echo "✅ DEPLOYED!"
    echo ""
    echo "Your site will be live in ~1 minute at:"
    echo "https://secret-uzbek.github.io/terra-ust-autobuild/"
    echo ""
else
    echo "⏸️  Deployment cancelled"
    echo "Run manually: git add . && git commit && git push"
fi

echo ""
echo "═══════════════════════════════════════════════"
echo "✅ INTEGRATION COMPLETE"
echo "═══════════════════════════════════════════════"
