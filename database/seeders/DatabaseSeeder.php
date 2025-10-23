<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Job;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        $admin = User::create([
            'name' => 'PT ABC',
            'email' => 'admin@abc.com',
            'password' => bcrypt('password'),
            'role' => 'admin'
        ]);

        User::create([
            'name' => 'X Freelancer',
            'email' => 'x_freelancer@gmail.com',
            'password' => bcrypt('password'),
            'role' => 'freelancer'
        ]);

        Job::create([
            'user_id' => $admin->id,
            'title' => 'Laravel Backend Developer',
            'description' => 'Membangun API berbasis Laravel',
            'status' => 'published'
        ]);
    }
}
