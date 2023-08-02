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
        Schema::disableForeignKeyConstraints();

        Schema::create('test_series_topics', function (Blueprint $table) {
            $table->id();
            $table->string('t_name',40);
            $table->unsignedBigInteger('tsc_id')->index();
            $table->foreign('tsc_id')->references('id')->on('test_series_categories')->onDelete('cascade');
            $table->tinyInteger('status')->default('1');
            $table->timestamps();
        });

        Schema::enableForeignKeyConstraints();
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('test_series_topics');
    }
};
