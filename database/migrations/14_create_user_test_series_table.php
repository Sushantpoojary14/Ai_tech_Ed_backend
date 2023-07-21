<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('user_test_series', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('tsps_id')->index();
            $table->foreign('tsps_id')->references('id')->on('test_series_purchases')->onDelete('cascade');
            $table->unsignedBigInteger('user_id')->index();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->tinyInteger('complete_status')->default(0);
            $table->string('start_date');
            $table->string('end_date');
            $table->string('time_taken')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_test_series');
    }
};
