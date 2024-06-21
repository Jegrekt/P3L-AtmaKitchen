<div>
    <h1>Reset Password</h1>
    <p>Halo, {{ $user->name }}! Anda menerima email ini karena kami menerima permintaan reset password untuk akun Anda.</p>
    <p>Silakan klik tombol di bawah ini untuk mereset password Anda:</p>
    <p><a href="{{ $url }}">Reset Password</a></p>
    <p><strong>Perhatian:</strong> Permohonan reset password akan kadaluarsa dalam 15 menit.</p>
    <p>Jika Anda tidak merasa melakukan permintaan ini, Anda dapat mengabaikan email ini.</p>
    <p>Terima kasih, Tim Kami</p>
    <p>© {{ date('Y') }} {{ config('app.name') }}. All rights reserved.</p>
</div>