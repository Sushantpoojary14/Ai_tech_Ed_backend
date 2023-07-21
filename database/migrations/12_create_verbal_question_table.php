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
        Schema::create('verbal_question', function (Blueprint $table) {
            $table->id();
            $table->string('question');
            $table->string('A');
            $table->string('B');
            $table->string('C');
            $table->string('D');
            $table->string('E')->nullable();
            $table->string('answer');
            $table->string('explanation');
            $table->unsignedBigInteger('ts_id')->index();
            $table->foreign('ts_id')->references('id')->on('test_series')->onDelete('cascade');
            $table->unsignedBigInteger('tsc_id')->index();
            $table->foreign('tsc_id')->references('id')->on('test_series_categories')->onDelete('cascade');
            $table->unsignedBigInteger('tst_id')->index();
            $table->foreign('tst_id')->references('id')->on('test_series_topics')->onDelete('cascade');
            $table->string('marks')->nullable();
            $table->tinyInteger('status')->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('verbal_question');
    }
};
