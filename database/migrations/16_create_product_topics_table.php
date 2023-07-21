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
        Schema::create('product_topics', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('tsp_id')->index();
            $table->foreign('tsp_id')->references('id')->on('test_series_product')->onDelete('cascade');
            $table->unsignedBigInteger('t_id')->index();
            $table->foreign('t_id')->references('id')->on('test_series_topics')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('product_topics');
    }
};
