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
        Schema::create('extra_question_field', function (Blueprint $table) {
            $table->id();
            $table->text('conversation');
            $table->text('paragraph');
            $table->unsignedBigInteger('q_id')->nullable();
            $table->foreign('q_id')->references('id')->on('question')->onDelete('cascade');
            // $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('extra_question_field');
    }
};