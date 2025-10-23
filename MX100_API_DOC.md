# Dokumentasi API – MX100 Job Portal

## Autentikasi
Gunakan **Laravel Sanctum Token**.  
Setelah login, tambahkan header berikut di setiap request:


---

## 1. LOGIN USER

**Endpoint:** `POST /api/login`  
**Deskripsi:** Login user.

### Request Body (JSON)

```json
{
  "email": "x_freelancer@gmail.com",
  "password": "password"
}
```

### Response Body (JSON)

```json
{
    "success": true,
    "data": {
        "id": 2,
        "name": "X Freelancer",
        "email": "x_freelancer@gmail.com",
        "role": "freelancer",
        "created_at": "2025-10-23T09:46:17.000000Z",
        "updated_at": "2025-10-23T09:46:17.000000Z",
        "token": "10|Sap43EINUYfwnO4aozYqtKaLxhWes8yA2ctso7QMea5375ab"
    },
    "message": "User logged in successfully"
}
```

## 2. LOGOUT USER

**Endpoint:** `POST /api/logout`  
**Deskripsi:** Logout user.

### Response Body (JSON)

```json
{
  "message": "Logged out"
}
```

## 3. List Jobs

**Endpoint:** `GET /api/jobs`  
**Deskripsi:** Mengambil daftar lowongan pekerjaan.

### Response Body (JSON)

```json
{
    "success": true,
    "data": [
        {
            "id": 1,
            "user_id": 1,
            "title": "Laravel Backend Developer",
            "description": "Membangun API berbasis Laravel",
            "status": "published",
            "created_at": "2025-10-23T09:46:17.000000Z",
            "updated_at": "2025-10-23T09:46:17.000000Z"
        },
    ],
    "message": "Jobs retrieved successfully"
}
```

## 4. Create Job

**Endpoint:** `POST /api/jobs`  
**Deskripsi:** Membuat lowongan pekerjaan baru.

### Request Body (JSON)

```json
{
  "title": "Full Stack Developer",
  "description": "Membangun aplikasi dengan Laravel dan React",
  "status": "draft"
}
```

### Response Body (JSON)

```json
{
    "success": true,
    "data": {
        "user_id": 1,
        "title": "Full Stack Developer",
        "description": "Membangun aplikasi dengan Laravel dan React",
        "status": "draft",
        "updated_at": "2025-10-23T22:07:20.000000Z",
        "created_at": "2025-10-23T22:07:20.000000Z",
        "id": 2
    },
    "message": "Job created successfully"
}
```

## 5. Update Job

**Endpoint:** `PUT /api/jobs/{job}`  
**Deskripsi:** Mengupdate lowongan pekerjaan.

### Request Body (JSON)

```json
{
  "status": "published"
}
```

### Response Body (JSON)

```json
{
  "success": true,
  "data": {
    "id": 2,
    "title": "Full Stack Developer",
    "status": "published",
    "description": "Membangun aplikasi dengan Laravel dan React",
    "created_at": "2025-10-23T10:12:00.000000Z",
    "updated_at": "2025-10-23T10:15:00.000000Z"
  },
  "message": "Job updated successfully"
}
```

## 6. Delete Job

**Endpoint:** `DELETE /api/jobs/{job}`  
**Deskripsi:** Menghapus lowongan pekerjaan.

### Response Body (JSON)

```json
{
    "success": true,
    "data": {
        "id": 1,
        "user_id": 1,
        "title": "Full Stack Developer",
        "description": "Membangun aplikasi dengan Laravel dan React",
        "status": "draft",
        "created_at": "2025-10-23T13:45:20.000000Z",
        "updated_at": "2025-10-23T13:45:20.000000Z"
    },
    "message": "Job deleted successfully"
}
```

## 7. Apply Job

**Endpoint:** `POST /api/jobs/{job}/apply`  
**Auth:** Freelancer
**Tipe:** multipart/form-data
**Deskripsi:** Melamar untuk lowongan pekerjaan.

### Request Body (form-data)

```json
{
  "cv": "file.pdf"
}
```

### Response Body (JSON)

```json
{
    "success": true,
    "data": {
        "job_id": 1,
        "freelancer_id": 2,
        "cv_path": "cvs/CQNVHTYnRnOMgWWc5uTt2XDsNJkXgwuV0SFSV0Hd.pdf",
        "updated_at": "2025-10-23T22:05:03.000000Z",
        "created_at": "2025-10-23T22:05:03.000000Z",
        "id": 1
    },
    "message": "Application created successfully"
}
```

## 8. View Applications

**Endpoint:** `GET /api/jobs/{job}/applications`  
**Auth:** Admin
**Deskripsi:** Mengambil daftar aplikasi untuk lowongan pekerjaan.

### Response Body (JSON)

```json
{
    "success": true,
    "data": [
        {
            "id": 1,
            "job_id": 1,
            "freelancer_id": 2,
            "cv_path": "cvs/CQNVHTYnRnOMgWWc5uTt2XDsNJkXgwuV0SFSV0Hd.pdf",
            "created_at": "2025-10-23T22:05:03.000000Z",
            "updated_at": "2025-10-23T22:05:03.000000Z",
            "freelancer": {
                "id": 2,
                "name": "X Freelancer",
                "email": "x_freelancer@gmail.com",
                "role": "freelancer",
                "created_at": "2025-10-23T09:46:17.000000Z",
                "updated_at": "2025-10-23T09:46:17.000000Z"
            }
        }
    ],
    "message": "Applications retrieved successfully"
}
```

## 9. Error Token
Jika tidak memiliki izin:
### Response Body (JSON)

```json
{
  "message": "Unauthorized"
}
```










