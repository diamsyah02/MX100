<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Application extends Model
{
    use HasFactory;

    protected $fillable = ['job_id', 'freelancer_id', 'cv_path'];

    public function job() {
        return $this->belongsTo(Job::class);
    }

    public function freelancer() {
        return $this->belongsTo(User::class, 'freelancer_id');
    }
}
