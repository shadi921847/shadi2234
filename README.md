# Construction ERP

نظام ERP للمقاولات الكهربائية والصيانة مبني على:

- Frontend: React + TypeScript + Vite
- UI: Tailwind CSS + shadcn/ui
- Backend: Node.js + Express
- ORM: Prisma
- Database: PostgreSQL مع دعم SQLite للتطوير
- Authentication: JWT + Refresh Token
- Charts: Recharts
- PDF: pdf-lib
- Excel: ExcelJS

## التشغيل المحلي

### المتطلبات

- Node.js 22+
- pnpm 10+

### التثبيت

```bash
pnpm install
```

### البيئة المحلية

انسخ:

- `.env.example`
- `apps/api/.env.example`
- `apps/web/.env.example`

### قاعدة البيانات

```bash
pnpm db:generate:sqlite
pnpm db:seed
```

### التشغيل

```bash
pnpm dev:api
pnpm dev:web
```

## النشر المجاني المقترح

هذا المستودع أصبح مهيأً للعمل كرابط عام بدون جهازك الشخصي. التوصية الحالية:

- الواجهة: Vercel Hobby
- الـ API: Render Free Web Service
- قاعدة البيانات: Neon Free Postgres
- الملفات والمرفقات: Cloudinary Free

تمت إضافة ملفات نشر جاهزة في الجذر:

- `render.yaml` للـ API
- `vercel.json` للواجهة

السبب:

- الواجهة ثابتة وسريعة وتقبل رابطًا مجانيًا من `vercel.app`.
- الـ API يعمل على Node.js/Express مباشرة.
- Neon يعطي قاعدة PostgreSQL مجانية مستقرة بدل SQLite المحلي.
- Cloudinary يتجنب الاعتماد على قرص مؤقت داخل الاستضافة.

### قيود مهمة

- Render Free Web Service يتوقف بعد فترة خمول ويحتاج تقريبًا دقيقة عند أول طلب بعد الاستيقاظ.
- Render Free Services ليست مناسبة لإنتاج تجاري ثقيل.
- Neon Free محدود بسعة صغيرة، ويجب مراقبة حجم قاعدة البيانات وحركة الخروج.
- Cloudinary Free يعتمد على سقف استخدام وcredits، وليس مناسبًا لتخزين ضخم طويل الأمد.

### ملفات البيئة للنشر

- `apps/api/.env.production.example`
- `apps/web/.env.production.example`

### أول مدير

استخدم الوضع الآمن مرة واحدة فقط:

```bash
SEED_MODE=minimal
INITIAL_ADMIN_EMAIL=admin@your-company.com
INITIAL_ADMIN_PASSWORD=StrongPasswordHere
INITIAL_ADMIN_NAME=System Administrator
```

ثم شغّل:

```bash
pnpm --filter @erp/api prisma:seed
```

بعد الإنشاء، لا تعِد استخدام هذا الإجراء إلا عند الحاجة.

## أوامر البناء

```bash
pnpm --filter @erp/shared build
pnpm --filter @erp/api build
pnpm --filter @erp/web build
node scripts/copy-web-dist.mjs
```

## النسخ الاحتياطي

- يمكن تنزيل نسخة احتياطية من لوحة الإدارة.
- النسخ الاحتياطي يعمل من خلال الـ API وليس من مجلد محلي في الإنتاج.
- الاستعادة تتحقق من التوقيع/الـ checksum قبل التنفيذ.
- اعتمد دائمًا على تنزيل نسخة خارج الخدمة، لأن النسخة داخل نفس المنصة ليست بديلًا كاملًا.

## التوثيق

- [إعداد النشر المجاني](docs/free-deployment.md)
- [إعدادات النشر الحالية](docs/production-deploy.md)
- [إعدادات staging](docs/staging-deploy.md)
