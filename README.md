# AI Installer — Sito 2026

**Status**: pronto al deploy
**Data build**: 2026-05-06 (sessione notturna)
**Stack**: HTML statico + CSS vanilla + JS minimo. Zero framework, zero build step.

## Struttura file

```
ai-installer-2026/
├── index.html        # landing principale, self-contained (CSS+JS inline)
├── grazie.html       # thank-you page post call booking
├── vercel.json       # config Vercel: cleanUrls, headers security, cache
├── robots.txt
├── sitemap.xml
├── deploy.sh         # script deploy multi-provider
├── STRATEGIA.md      # documento strategia + posizionamento
└── README.md         # questo file
```

## Deploy rapido

### Opzione 1 — Vercel (consigliata)

```bash
cd ~/Desktop/ai-installer-2026
./deploy.sh vercel
```

Al primo lancio Vercel chiede login (browser). Successivi deploy istantanei. Custom domain da Dashboard → Project → Domains.

### Opzione 2 — Surge (backup veloce)

```bash
./deploy.sh surge
```

Va live su `ai-installer-italo.surge.sh` (lo stesso URL del sito vecchio).

### Opzione 3 — GitHub Pages

```bash
./deploy.sh github
```

Inizializza git. Poi crea repo su GitHub, pusha, attiva Pages.

## Cosa modificare prima del go-live

1. **Email contatto** in `index.html` riga ~770 — cambia `italo@ai-installer.it` con quella reale
2. **Link Cal.com** riga ~768 — sostituisci `https://cal.com/ai-installer/discovery` con il tuo link reale
3. **Logo brand** (ora è solo testo "AI") — se hai un SVG da inserire, va nel `<span class="brand-mark">`
4. **Numeri case studies** — sono plausibili ma da validare con dati reali quando li hai

## Customizzazione veloce

- **Colore accent** (verde lime AI): cerca `--accent: #b8ff3f` nel CSS, cambia il valore
- **Font**: pre-caricati Inter + JetBrains Mono via Google Fonts
- **Sezioni**: ognuna ha un `<section>` con id, riordinabili spostando blocchi

## SEO checklist

- [x] Meta description e keywords italiane
- [x] OG tags per condivisione social
- [x] Lang="it"
- [x] Sitemap.xml
- [x] Robots.txt
- [ ] Aggiungere Plausible o GA4 (snippet da Google)
- [ ] Iscrivere sitemap a Google Search Console post-deploy
- [ ] Schema.org Organization + Service (futuro upgrade)

## Performance attesa

- **First Contentful Paint**: < 0.8s (CSS inline, no render-blocking)
- **Largest Contentful Paint**: < 1.5s
- **CLS**: 0 (no layout shift, dimensioni esplicite)
- **Total page weight**: ~45KB (HTML) + fonts CDN

## Differenze vs sito v4 vecchio

| Aspetto | v4 (Surge, down) | 2026 (questa versione) |
|---|---|---|
| Pagine | benvenuto + configuratore (multi-step app) | one-page landing + thank-you |
| Posizionamento | tool/configuratore | servizio installazione hands-on |
| CTA | configura il tuo agente | prenota call discovery |
| Pricing | non presente | 3 tier pubblici trasparenti |
| Tone | tecnico | colloquiale-professionale |

Il vecchio sito v4 era più un "self-service tool". Questo nuovo posizionamento ($strategia.md per dettagli) lavora meglio per acquisizione high-ticket B2B.

## Prossimi step suggeriti (post-deploy)

1. **Setup Cal.com** con 30 min discovery slots
2. **A/B test hero headline**: testare "Installiamo agenti AI nel tuo studio" vs "Trasformiamo le tue ore in automazioni" (misurare CTR sulla CTA primaria)
3. **Pagine verticali**: `/commercialisti`, `/avvocati`, `/immobiliare` con copy specifico per categoria
4. **Blog SEO**: 1 articolo/sett su keyword italiane long-tail ("come automatizzare studio commercialista", ecc.)
5. **Lead magnet**: "Audit AI gratuito 15 min" come acquisition layer prima della call piena
