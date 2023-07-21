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
        Schema::create('user_test_status', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('q_id')->index();
            $table->foreign('q_id')->references('id')->on('users')->onDelete('cascade');
            $table->unsignedBigInteger('status_id')->index();
            $table->foreign('status_id')->references('id')->on('test_status')->onDelete('cascade');
            $table->string('test_answer')->nullable();
            $table->unsignedBigInteger('uts_id')->index();
            $table->foreign('uts_id')->references('id')->on('user_test_series')->onDelete('cascade');
            $table->string('test_time');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_test_status');
    }
};
