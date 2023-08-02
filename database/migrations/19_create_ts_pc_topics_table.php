<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('ts_pc_topics', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('tspc_id')->index();
            $table->foreign('tspc_id')->references('id')->on('test_series_product')->onDelete('cascade');
            $table->unsignedBigInteger('tst_id')->index();
            $table->foreign('tst_id')->references('id')->on('test_series_categories')->onDelete('cascade');
            $table->integer('set_number');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ts_pc_topics');
    }
};
