<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', '$DB_NAME' );

/** MySQL database username */
define( 'DB_USER', '$DB_USER' );

/** MySQL database password */
define( 'DB_PASSWORD', '$DB_PASSWORD' );

/** MySQL hostname */
define( 'DB_HOST', '$DB_HOST' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'i)k*I>)lU:>9k/z93!la/D!fRf:s-EiIMfM-P;1:Npd7CkYYo-K1,BwJ16=v.M:4');
define('SECURE_AUTH_KEY',  'lF]}^mw>0<fV?w(?Yz|Hm2`Q*%E7mH,JX.!D]#*|OFe.!ZaD!z-wGXi.-p]Il}yn');
define('LOGGED_IN_KEY',    'Y]1p2-^dH@W:Un0e=N|sTpnnm}>A[4cNiFzHdI*N5+C+<=/#V0DV5Vbejucu@GA%');
define('NONCE_KEY',        '^.6-$ROqj`U? =4THF+qS]q@(mDF[BusYmofpBp&@d~J+/Ek:o0i,kz[]n~%bMk&');
define('AUTH_SALT',        '&oW8`kx|&aA.p([Yb-ICCbFUS)&a|f95~ynd*}Xk+@b;w-C}h[1|3wDHWIMH(!} ');
define('SECURE_AUTH_SALT', 's^lEwdEqm$I-y-Dk{%oGq+=zl-fXUlSHYaZw6R_LtW1<qZB.oKXE-&I1e[+^/Gd:');
define('LOGGED_IN_SALT',   '+/+<EoI|#)8B~|T.qp74/BH10A2C<2BhBDp!hm>prZ;Q<wcpE*<?EbEtqe_tDuD ');
define('NONCE_SALT',       'l-ak]}LohY>}aTMU!8z|w2%*.$vwxJ$mh@w1> L&tYILNkx@3FG=)%Dj<Yx-@C-&');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';