<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('workouts', function (Blueprint $table) {
            $table->id();
            $table->string('name');                     // Nama workout
            $table->text('description')->nullable();    // Deskripsi workout
            $table->integer('duration');                // Durasi dalam menit
            $table->integer('calories_burn');           // Kalori yang terbakar
            $table->enum('difficulty', ['beginner', 'intermediate', 'advanced']);
            $table->string('equipment_needed')->nullable();  // Peralatan yang dibutuhkan
            $table->string('video_url')->nullable();    // URL video tutorial
            $table->string('image_url')->nullable();    // URL gambar
            $table->boolean('is_premium')->default(false);  // Workout premium atau free
            $table->integer('sets')->default(1);        // Jumlah set
            $table->integer('reps')->nullable();        // Jumlah repetisi
            $table->integer('rest_duration')->nullable(); // Durasi istirahat dalam detik
            $table->foreignId('category_id')           // Relasi ke kategori workout
                ->constrained('workout_categories')
                ->onDelete('cascade');
            $table->boolean('is_active')->default(true); // Status aktif/nonaktif
            $table->timestamps();
            $table->softDeletes();                     // Untuk soft delete
            
            // Indexes untuk optimasi query
            $table->index('name');
            $table->index('difficulty');
            $table->index(['category_id', 'is_active']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('workouts');
    }
};