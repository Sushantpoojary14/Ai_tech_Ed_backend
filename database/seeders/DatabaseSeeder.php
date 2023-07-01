<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Admin;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        User::factory(2)->create();
        Admin::factory(2)->create();
        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'user@example.com',
        // ]);


        // \App\Models\Admin::factory()->create([
        //     'name' => 'Test admin',
        //     'email' => 'admin@example.com',
        // ]);
    }
}
