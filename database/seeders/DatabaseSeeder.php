<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Admin;
use App\Models\TestSeriesPurchases;
use App\Models\TestSeriesTopics;
use App\Models\User;
use App\Models\TestSeries;
use App\Models\TestSeriesCategories;
use App\Models\TestSeriesProduct;
use App\Models\VerbalQuestion;
use Illuminate\Database\Seeder;
use App\Models\TestStatus;
class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        User::factory(2)->create();
        Admin::factory(1)->create();

        $tsc =  TestSeries::factory()->create([
            'test_type' => 'oc',
        ])
        ->create([
            'test_type' => 'selective',
        ]);

        $tsc = TestSeriesCategories::factory()->create([
            'tsc_type' => 'Maths',
        ])
        ->create([
            'tsc_type' => 'Reading',
        ])
        ->create([
            'tsc_type' => 'Logical',
        ]);

        TestSeriesProduct::factory(2)->create();

        TestStatus::query()->create([
            'type' => 'Answered',
        ])
        ->create([
            'type' => 'Not Answered',
        ])
        ->create([
            'type' => 'Not Visited',
        ])
        ->create([
            'type' => 'Marked for Review',
        ])
        ->create([
            'type' => 'Answered & Marked for
            Review',
        ]);

        TestSeriesPurchases::factory(2)->create();
        TestSeriesTopics::factory(15)->create();

        VerbalQuestion::factory(135)->create();


        // \App\Models\Admin::factory()->create([
        //     'name' => 'Test admin',
        //     'email' => 'admin@example.com',
        // ]);
    }
}
