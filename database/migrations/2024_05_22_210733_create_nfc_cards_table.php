<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNfcCardsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('nfc_cards', function (Blueprint $table) {
            $table->id();
            $table->string('nombre');
            $table->text('ciudad')->nullable();
            $table->string('celular')->nullable();
            $table->string('telefono_opc')->nullable();
            $table->string('telefono_opci')->nullable();
            $table->string('cargo')->nullable();
            $table->string('correo')->nullable();
            $table->string('correo_opc')->nullable();
            $table->string('pagina')->nullable();
            $table->string('pagina_opc')->nullable();
            $table->string('pagina_opcional')->nullable();
            $table->string('empresa')->nullable();
            $table->string('feature')->nullable();
            $table->unsignedBigInteger('event_id')->nullable();
            $table->timestamps();

            $table->foreign('event_id')->references('id')->on('events')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('nfc_cards');
    }
}
