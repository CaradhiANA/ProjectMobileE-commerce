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
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('image');
            $table->string('nama');
            $table->integer('harga');
            $table->integer('stock');
            $table->enum('jenis', ['Tempe', 'BuahBuahan', 'Umbi'])->default('Tempe');
            $table->date('kadaluarsa');
            $table->float('berat')->default(0);
            $table->integer('rating')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
