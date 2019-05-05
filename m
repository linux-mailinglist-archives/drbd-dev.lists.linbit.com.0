Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FE72B885
	for <lists+drbd-dev@lfdr.de>; Mon, 27 May 2019 17:42:29 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 483EF1028A76;
	Mon, 27 May 2019 17:42:28 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 1D2851011BFC
	for <drbd-dev@lists.linbit.com>; Mon, 27 May 2019 17:42:26 +0200 (CEST)
Received: by mail-wr1-f68.google.com with SMTP id t4so9009786wrx.7
	for <drbd-dev@lists.linbit.com>; Mon, 27 May 2019 08:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:date:from:to:subject:message-id
	:mime-version:content-disposition:content-transfer-encoding
	:user-agent;
	bh=onnzAuV3ZVoJZSjUucoxdy8OXc7MdNYg2xcXGTvczwo=;
	b=EsSNOI01GN7H8MwdSi8RlpnBtWtDexA3d9eYNOX9QIU7WT3KNjZzjr34Rh/RcDfTrd
	Y00qfFaYwmxCloyua5KWShQNt9PaaASV9YKGS6No90ZhqzyLHFTgFRgbe95kWxcoHNrJ
	XOBhuP0u1VJcM7ls49xsmLtTDJ+DDer8raKlldn5/ShhkjTeY6zDW7AJHs2bmMGsF53/
	iUNGFtB5zpemcptsVK+6WJiJ4UdxVVi4ookBw0swK2b4K+YMlfDmhTdNITA15I/cGmA7
	3tCoQQAx5YYhDxPNGXoAjQRJuN/9HQorXNKueTiRWOZl7h6QlVf8hjjKIyVPQ5K9QceA
	wnEA==
X-Gm-Message-State: APjAAAXlMClveDygf+MRZzcgQOdDKAFdCrtGvYTV35ioUZetepNgD3vV
	SxjFtzJYpvkiESM2mWzKlk0iz3/R5K44hQ==
X-Google-Smtp-Source: APXvYqzNbUPYtpw9GgKYYCtgwd83eqv6+ZT0rT0PcXXUBdIhhv1N08GgoyiYEjEfgFow8c6PGyR+ZA==
X-Received: by 2002:a5d:43c9:: with SMTP id v9mr5759608wrr.70.1558971745966;
	Mon, 27 May 2019 08:42:25 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219])
	by smtp.gmail.com with ESMTPSA id w2sm4981967wru.16.2019.05.27.08.42.25
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 27 May 2019 08:42:25 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 27 May 2019 17:42:22 +0200
Resent-Message-ID: <20190527154222.GA5803@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 1FDF01011BFF
	for <drbd-dev@lists.linbit.com>; Mon,  6 May 2019 00:23:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1557095009;
	bh=0to9aQztkzngPNOMzshiFNlFaZiT59rL6T6hAiU2bZI=;
	h=X-UI-Sender-Class:Date:From:To:Subject;
	b=H/Yd9o43WYU/q0jDfpt5+ijb9eg5X3yvB2rbW8TVBSCwZi/hSpjqBSXh8V3N4y8fK
	uMEFrnaiVneqrFRAa2LlClkajiKVPnUdbbpVwPC1VyzoJgyxW7tGK/rDGeSww6A8SM
	w3qa3qITxnYV5MQ9QTME6gT9uBADYzC3Af4mk32g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.dellerweb.de ([92.116.187.88]) by mail.gmx.com (mrgmx102
	[212.227.17.168]) with ESMTPSA (Nemesis) id 0LqW8j-1gsUi13ozR-00e5uF;
	Mon, 06 May 2019 00:23:29 +0200
Date: Mon, 6 May 2019 00:23:27 +0200
From: Helge Deller <deller@gmx.de>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Jens Axboe <axboe@kernel.dk>, drbd-dev@lists.linbit.com,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <20190505222327.GA32268@ls3530.dellerweb.de>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Provags-ID: V03:K1:UjfJ4usowKn/6EYdHyPsJ9a4AFua2i4rNp/24cGOEtp8M1nChUG
	WXmQXWJgYhK4GzkSqdanbOkJqxa4+mr49LW517/ufiCvTJSsmJvcZNy/92FtvjnLZCSNYyK
	bNSEeVbuPWIUlI/cYQ0SN66HDUmZw2YdgCfkA5GcJAoysv+nSNSUxGM+TkmRYhXvMcEBucD
	Wb46SPqW602Os9WrhI8+g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:F9j4RhW32lM=:/6xtdpiXI3/sGIoeZ0GNx0
	/1zbs9ZLxX2gz8XPgzDrG0Bq7VxklD0EQW91Wi7QMe0MdB/uJnchupKf30FIftv3YoStqFHtS
	Iu35BmM0vIePIHcyctkpmV1ww1INO/utLjs8/kxJ60rUKnjbLmmBzSfRcFW/WbjKqp/nyfhjI
	MKB2z116ya5+8rskTdhgv/sjlCxyyPUCog1s1iu4mngladLwCClMaZg8dzV7/2r/k4lF8Wb4L
	xZJFWdZYlQ3+C38hE4d5mPZa3cH8wc9LZWWlNWZpa/cpkSKoeR5ahYK6zanxXMHelVxRRwcWq
	r73cDw0gxjc0A53TLpnvvajHJjb5awMSTsb09myoyhNCl5zYawQXvvygndCl/HD+u+jfistsm
	Eb2rnunXPvsjftC4McU9HhzHbYCctaRG/N1XA46v+wvae7P2zsyVjWNrDpvMm3DpQAw9V95LE
	5WESkNHXAkqVlM3/zS40eSxeOaxwpbLGE7d80XLkwpcplivlIZRhQhv33DmzAZ4loLb72es8c
	24UN7pPupER2Bg79y2g3+23I92LFYNOK2DpHVluhRP+/0JqTCm1+A6/63mcVPJCa/wtOmRBQw
	Ax9+zTzc4uQmlDRvmM9I4tylFEIjfWJLsoxZBsi4QWOeQxSoZzeMV1I3Wu+0mUojhGjO/mqYy
	J1GvlaUHbM+nvehHRNDTUiim9DN9IAynMgsLirFlafAwIgFiB1pfQnWAF9SB1OB1OxjQBv2Fv
	LDAsQcSIX41/zOoA44EHI7GADseNXQB3iSuNTgIZTrBzmwYy5Bfs4Tk2m1jl4ePqvDlPk8A8l
	CU3bYnHPNsatNuFDo3ZYkMRgNIbP5ldCRmPWrz02lbAdycXQKc3ld8GMl6N/SWf9E7VOjRXDX
	o1wQoiyuxDFpFY6c9prq47ldkyn36g/4/WLLinmSXeW9+HizSvIe4O1bn0yRij
Subject: [Drbd-dev] [PATCH] drbd: Rename LEVEL to VLI_LEVEL to avoid name
	clash
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Using a generic word like LEVEL is bad idea - it can easily clash with anot=
her
LEVEL defined somewhere else.
In this case, it clashed with the LEVEL defined in arch/parisc/include/asm/=
assembly.h
when the header file got included via jump_level.h.

This patch replaces the LEVEL defined in drbd_vli.h by VLI_LEVEL.
Another patch renames the LEVEL defined in arch/parisc/include/asm/assembly=
.h.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/block/drbd/drbd_vli.h b/drivers/block/drbd/drbd_vli.h
index 8cb1532a3816..d7ced8626035 100644
--- a/drivers/block/drbd/drbd_vli.h
+++ b/drivers/block/drbd/drbd_vli.h
@@ -121,22 +121,22 @@ prefix    data bits                                  =
  max val  N=BA data bits
  1             16              32                              64
 */

-/* LEVEL: (total bits, prefix bits, prefix value),
+/* VLI_LEVEL: (total bits, prefix bits, prefix value),
  * sorted ascending by number of total bits.
  * The rest of the code table is calculated at compiletime from this. */

 /* fibonacci data 1, 1, ... */
 #define VLI_L_1_1() do { \
-	LEVEL( 2, 1, 0x00); \
-	LEVEL( 3, 2, 0x01); \
-	LEVEL( 5, 3, 0x03); \
-	LEVEL( 7, 4, 0x07); \
-	LEVEL(10, 5, 0x0f); \
-	LEVEL(14, 6, 0x1f); \
-	LEVEL(21, 8, 0x3f); \
-	LEVEL(29, 8, 0x7f); \
-	LEVEL(42, 8, 0xbf); \
-	LEVEL(64, 8, 0xff); \
+	VLI_LEVEL( 2, 1, 0x00); \
+	VLI_LEVEL( 3, 2, 0x01); \
+	VLI_LEVEL( 5, 3, 0x03); \
+	VLI_LEVEL( 7, 4, 0x07); \
+	VLI_LEVEL(10, 5, 0x0f); \
+	VLI_LEVEL(14, 6, 0x1f); \
+	VLI_LEVEL(21, 8, 0x3f); \
+	VLI_LEVEL(29, 8, 0x7f); \
+	VLI_LEVEL(42, 8, 0xbf); \
+	VLI_LEVEL(64, 8, 0xff); \
 	} while (0)

 /* finds a suitable level to decode the least significant part of in.
@@ -147,7 +147,7 @@ static inline int vli_decode_bits(u64 *out, const u64 i=
n)
 {
 	u64 adj =3D 1;

-#define LEVEL(t,b,v)					\
+#define VLI_LEVEL(t,b,v)				\
 	do {						\
 		if ((in & ((1 << b) -1)) =3D=3D v) {	\
 			*out =3D ((in & ((~0ULL) >> (64-t))) >> b) + adj;	\
@@ -160,7 +160,7 @@ static inline int vli_decode_bits(u64 *out, const u64 i=
n)

 	/* NOT REACHED, if VLI_LEVELS code table is defined properly */
 	BUG();
-#undef LEVEL
+#undef VLI_LEVEL
 }

 /* return number of code bits needed,
@@ -173,7 +173,7 @@ static inline int __vli_encode_bits(u64 *out, const u64=
 in)
 	if (in =3D=3D 0)
 		return -EINVAL;

-#define LEVEL(t,b,v) do {		\
+#define VLI_LEVEL(t,b,v) do {		\
 		max +=3D 1ULL << (t - b);	\
 		if (in <=3D max) {	\
 			if (out)	\
@@ -186,7 +186,7 @@ static inline int __vli_encode_bits(u64 *out, const u64=
 in)
 	VLI_L_1_1();

 	return -EOVERFLOW;
-#undef LEVEL
+#undef VLI_LEVEL
 }

 #undef VLI_L_1_1
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
