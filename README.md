# Steps Run Project

## 1. Clone Project
```bash
git clone https://github.com/diamsyah02/MX100.git
```

## 2. Copy .env.example to .env
```bash
cp .env.example .env
```

## 3. Install Dependencies
```bash
composer install
```

## 4. Generate Application Key
```bash
php artisan key:generate
```

## 5. Update .env (DB & lainnya)

## 6. Migrate Database
```bash
php artisan migrate --seed
```

## 7. Create Storage Link
```bash
php artisan storage:link
```

## 8. Run Project
```bash
php artisan serve
```