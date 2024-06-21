<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class TrxPenjualan
 *
 * @property int $id
 * @property string|null $no_nota
 * @property int $id_customer
 * @property int|null $id_alamat
 * @property Carbon $tanggal_pesan
 * @property Carbon|null $tanggal_lunas
 * @property Carbon $tanggal_siap
 * @property Carbon|null $tanggal_ambil
 * @property int $harga_pesanan
 * @property string|null $metode_pembayaran
 * @property string|null $bukti_pembayaran
 * @property int|null $poin_didapat
 * @property int|null $poin_dipakai
 * @property int|null $tip
 * @property int|null $ongkos_kirim
 * @property int $grand_total
 * @property string $jenis_pengiriman
 * @property string $status_pesanan
 *
 * @property Alamat|null $alamat
 * @property Customer $customer
 * @property Collection|DetailPenjualan[] $detail_penjualans
 * @property Collection|TrxPemakaianBb[] $trx_pemakaian_bbs
 *
 * @package App\Models
 */
class TrxPenjualan extends Model
{
	protected $table = 'trx_penjualan';
	public $timestamps = false;

	protected $casts = [
		'id_customer' => 'int',
		'id_alamat' => 'int',
		'tanggal_pesan' => 'datetime',
		'tanggal_lunas' => 'datetime',
		'tanggal_siap' => 'datetime',
		'tanggal_ambil' => 'datetime',
		'harga_pesanan' => 'int',
		'poin_didapat' => 'int',
		'poin_dipakai' => 'int',
		'tip' => 'int',
		'ongkos_kirim' => 'int',
		'grand_total' => 'int'
	];

	protected $fillable = [
		'no_nota',
		'id_customer',
		'id_alamat',
		'tanggal_pesan',
		'tanggal_lunas',
		'tanggal_siap',
		'tanggal_ambil',
		'harga_pesanan',
		'metode_pembayaran',
		'bukti_pembayaran',
		'poin_didapat',
		'poin_dipakai',
		'tip',
		'ongkos_kirim',
		'grand_total',
		'jenis_pengiriman',
		'status_pesanan'
	];

	public function alamat()
	{
		return $this->belongsTo(Alamat::class, 'id_alamat');
	}

	public function customer()
	{
		return $this->belongsTo(Customer::class, 'id_customer');
	}

	public function detail_penjualans()
	{
		return $this->hasMany(DetailPenjualan::class, 'id_trx_penjualan');
	}

	public function trx_pemakaian_bbs()
	{
		return $this->hasMany(TrxPemakaianBb::class, 'id_trx_penjualan');
	}

	public static function getOngkosKirim(float $jarak) {
        $ongkosKirim = 0;
        if ($jarak <= 5) {
            $ongkosKirim = 10000;
        } else if ($jarak <= 10) {
            $ongkosKirim = 15000;
        } else if ($jarak <= 15) {
            $ongkosKirim = 20000;
        } else {
            $ongkosKirim = 25000;
        }
        return $ongkosKirim;
    }
}
