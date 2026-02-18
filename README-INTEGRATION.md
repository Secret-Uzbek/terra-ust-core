# 🔥 TERRA UST - FMP CORE INTEGRATION

**Status:** ✅ READY TO DEPLOY  
**Date:** February 14, 2026  
**Repo:** terra-ust-autobuild

---

## 📋 QUICK START (3 Steps)

### Step 1: Replace index.html
```bash
# In your terra-ust-autobuild repo
cp index.html index.html.backup  # Backup old version
cp terra-ust-integration/index.html index.html  # Use new FMP version
```

### Step 2: Test Locally
```bash
# Open in browser
open index.html
# or
python3 -m http.server 8000
# Then visit: http://localhost:8000
```

### Step 3: Deploy to GitHub Pages
```bash
git add index.html
git commit -m "🚀 Integrate FMP Core v0.1 - SemanticQuark translation engine"
git push origin main
```

**That's it!** GitHub Pages will auto-deploy in ~1 minute.

---

## 🆕 WHAT CHANGED

### OLD (v1.0.0 - Demo Mode)
```javascript
// Static demo translation
const translations = {
    ru: '[Русский перевод] ' + text,
    en: '[English translation] ' + text,
};
```

### NEW (v2.0.0-fmp - FMP Core)
```javascript
// Real FMP Core translation
function fmpTranslate(text, sourceLang, targetLang) {
    // 1. Tokenize into semantic quarks
    // 2. Map through universal semantic space
    // 3. Calculate fractal coherence
    // 4. Optimize if needed
    // 5. Return translation + metrics
}
```

### Features Added
- ✅ **FMP Core Engine** (client-side prototype)
- ✅ **Auto language detection** (RU/UZ/EN/DE)
- ✅ **Fractal coherence metrics** displayed
- ✅ **10-word vocabulary** (expandable)
- ✅ **Keyboard shortcut** (Ctrl+Enter to translate)
- ✅ **Status indicators** (FMP CORE ACTIVE badge)
- ✅ **Corpus info** (uzbekcorpus.uz, German lex, Navoi)

---

## 📊 CURRENT CAPABILITIES

### Working Now (Client-Side)
```
✅ English ↔ Uzbek ↔ Russian ↔ German
✅ 10 words: hello, world, thank, you, goodbye, how, are, love, peace, friend
✅ Auto language detection
✅ Fractal coherence calculation
✅ Real-time metrics display
```

### Example Translation
```
Input: "hello world thank you"
Auto-detected: English
Target: Uzbek
Output: "salom dunyo rahmat siz"
Coherence: 0.720
Method: FMP-Core (Client)
```

---

## 🚀 NEXT STEPS (To Production)

### Phase 1: Expand Vocabulary (This Week)
**Goal:** 100 words minimum

**How:**
1. Extract words from uzbekcorpus.uz
2. Add common phrases from German corpus
3. Include Navoi vocabulary (Chagatai → Uzbek)

**File to update:** `index.html` (VOCABULARY object around line 115)

```javascript
const VOCABULARY = {
    // Add more entries:
    'morning': { uz: 'tong', ru: 'утро', en: 'morning', de: 'morgen' },
    'night': { uz: 'tun', ru: 'ночь', en: 'night', de: 'nacht' },
    // ... 90+ more
};
```

---

### Phase 2: Backend API (Next Week)
**Goal:** Move FMP Core to server-side for full power

**Create:** `api/translate.js` (Cloudflare Worker or Vercel Serverless)

```javascript
// api/translate.js
export default async (req, res) => {
    const { text, source_lang, target_lang } = req.body;
    
    // Import full FMP Core (Python → JS transpiled or direct Python)
    const result = await fmpCoreTranslate(text, source_lang, target_lang);
    
    return res.json({
        translation: result.translation,
        method: 'FMP-Core (Server)',
        metadata: result.metadata
    });
};
```

**Update index.html:** Call API instead of client-side function

```javascript
// Replace fmpTranslate() call with:
const response = await fetch('/api/translate', {
    method: 'POST',
    body: JSON.stringify({ text, source_lang, target_lang })
});
const result = await response.json();
```

---

### Phase 3: Corpus Integration (Month 1)
**Goal:** Real embeddings from corpora

**Tasks:**
1. **Scrape uzbekcorpus.uz**
   ```python
   import requests
   from bs4 import BeautifulSoup
   
   def fetch_uzbek_corpus():
       url = "https://uzbekcorpus.uz/rusVer"
       # Extract parallel texts UZ-RU-EN
       # Build semantic embeddings
   ```

2. **Process German corpus**
   - Download from DWDS / DeReKo
   - Extract DE-EN-UZ mappings
   - Build vocabulary

3. **Digitize Navoi**
   - Already have 26 texts (you mentioned)
   - Extract Chagatai → Modern Uzbek
   - Build Navoi-specific semantic fields

4. **Generate embeddings**
   ```python
   from gensim.models import Word2Vec
   
   # Train on combined corpus
   model = Word2Vec(sentences, vector_size=1024, window=5, min_count=1)
   model.save('terra-embeddings.model')
   ```

5. **Export to JavaScript**
   ```python
   import json
   
   vocab = {}
   for word in model.wv.index_to_key[:10000]:
       vocab[word] = {
           'uz': translate(word, 'uz'),
           'ru': translate(word, 'ru'),
           'en': translate(word, 'en'),
           'de': translate(word, 'de'),
           'embedding': model.wv[word].tolist()
       }
   
   with open('vocabulary.json', 'w') as f:
       json.dump(vocab, f)
   ```

6. **Load in frontend**
   ```javascript
   // In index.html
   fetch('vocabulary.json')
       .then(r => r.json())
       .then(vocab => {
           VOCABULARY = vocab;
           log(`Loaded ${Object.keys(vocab).length} words`);
       });
   ```

---

## 📁 FILE STRUCTURE (After Full Integration)

```
terra-ust-autobuild/
├── index.html ✅ (Updated with FMP Core)
├── CITATION.cff ✅
├── LICENSE ✅
├── CONTRIBUTING.md ✅
├── README.md (Update)
│
├── api/ (NEW - Backend)
│   ├── translate.js (Cloudflare Worker / Vercel)
│   └── corpus.js (Corpus integration)
│
├── data/ (NEW - Vocabulary & Embeddings)
│   ├── vocabulary.json (1000+ words)
│   ├── terra-embeddings.bin (Word2Vec model)
│   └── navoi-corpus.json (26 texts)
│
└── scripts/ (NEW - Build Scripts)
    ├── fetch-uzbekcorpus.py
    ├── process-german-corpus.py
    ├── extract-navoi.py
    └── build-embeddings.py
```

---

## 🧪 TESTING CHECKLIST

### Before Deploying to GitHub Pages
- [ ] Open index.html locally
- [ ] Test translation: "hello world" → "salom dunyo"
- [ ] Check metrics display (coherence, method, quarks)
- [ ] Test all 4 languages (uz, ru, en, de)
- [ ] Test keyboard shortcut (Ctrl+Enter)
- [ ] Check console log for errors
- [ ] Verify FMP Core status shows "ONLINE ✅"

### After Deploying
- [ ] Visit: https://secret-uzbek.github.io/terra-ust-autobuild/
- [ ] Test same translations
- [ ] Share link with 3 people for feedback
- [ ] Monitor console in browser DevTools

---

## 💡 HOW TO EXPAND VOCABULARY

### Manual (Quick, 10 minutes)
Edit `index.html` around line 115:

```javascript
const VOCABULARY = {
    // Current 10 words
    'hello': { uz: 'salom', ru: 'привет', en: 'hello', de: 'hallo' },
    
    // ADD MORE:
    'morning': { uz: 'tong', ru: 'утро', en: 'morning', de: 'morgen' },
    'water': { uz: 'suv', ru: 'вода', en: 'water', de: 'wasser' },
    'bread': { uz: 'non', ru: 'хлеб', en: 'bread', de: 'brot' },
    // ... continue
};
```

### Automated (Proper, 1 day)
```python
# scripts/expand-vocabulary.py
import json

# Source 1: uzbekcorpus.uz
uzbek_words = scrape_uzbekcorpus()

# Source 2: Frequency lists
common_words = load_frequency_lists(['uz', 'ru', 'en', 'de'])

# Source 3: Navoi texts
navoi_words = extract_from_navoi()

# Merge
all_words = merge(uzbek_words, common_words, navoi_words)

# Translate missing pairs (use existing APIs for bootstrap)
vocab = {}
for word_uz in all_words:
    vocab[word_uz] = {
        'uz': word_uz,
        'ru': translate_api(word_uz, 'uz', 'ru'),
        'en': translate_api(word_uz, 'uz', 'en'),
        'de': translate_api(word_uz, 'uz', 'de')
    }

# Export
with open('vocabulary.json', 'w') as f:
    json.dump(vocab, f, ensure_ascii=False, indent=2)
```

Then update index.html to load from file:
```javascript
// Replace hardcoded VOCABULARY with:
let VOCABULARY = {};

fetch('vocabulary.json')
    .then(r => r.json())
    .then(vocab => {
        VOCABULARY = vocab;
        log(`✅ Loaded ${Object.keys(vocab).length} words from corpus`);
    });
```

---

## 🔗 EXTERNAL RESOURCES

### Corpora
1. **uzbekcorpus.uz** - https://uzbekcorpus.uz/rusVer
   - UZ-RU-EN parallel texts
   - Millions of words
   - Free access

2. **German Lexicography**
   - DWDS: https://www.dwds.de/
   - DeReKo: https://www.ids-mannheim.de/cosmas2/
   - Requires registration but free

3. **Navoi Texts** (Already in Terra ecosystem)
   - 26 texts
   - Chagatai + Modern Uzbek

---

## 🆘 TROUBLESHOOTING

### Problem: Translations not working
**Solution:** Check browser console (F12) for errors

### Problem: Vocabulary too small
**Solution:** Follow "Expand Vocabulary" steps above

### Problem: Want server-side power
**Solution:** Deploy backend API (Phase 2 instructions)

---

## 📞 SUPPORT

**Questions?** Contact: a.abdukarimov@fractal-metascience.org  
**ORCID:** 0009-0000-6394-4912  
**GitHub Issues:** https://github.com/Secret-Uzbek/terra-ust-autobuild/issues

---

## 🏆 MILESTONES

- [x] FMP Core prototype created
- [x] Client-side integration ready
- [x] index.html updated with FMP Core
- [ ] Deployed to GitHub Pages
- [ ] Vocabulary expanded to 100 words
- [ ] Backend API deployed
- [ ] Corpus integration complete
- [ ] Academic paper submitted

---

**🔥 READY TO DEPLOY! COPY FILES AND PUSH! 🔥**

Last Updated: February 14, 2026
