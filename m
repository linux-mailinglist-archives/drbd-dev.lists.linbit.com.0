Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD2C31E7C2
	for <lists+drbd-dev@lfdr.de>; Thu, 18 Feb 2021 10:07:54 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0C72F420317;
	Thu, 18 Feb 2021 10:07:53 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 639 seconds by postgrey-1.31 at mail19;
	Wed, 17 Feb 2021 23:13:39 CET
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 54ED642011A
	for <drbd-dev@lists.linbit.com>; Wed, 17 Feb 2021 23:13:39 +0100 (CET)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 88A821C0B8E; Wed, 17 Feb 2021 23:02:59 +0100 (CET)
Date: Wed, 17 Feb 2021 23:02:58 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Message-ID: <20210217220257.GA10791@amd>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
	<20210128071133.60335-30-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20210128071133.60335-30-chaitanya.kulkarni@wdc.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Thu, 18 Feb 2021 10:07:51 +0100
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
	gustavoars@kernel.org, sergey.senozhatsky.work@gmail.com,
	snitzer@redhat.com, tiwai@suse.de, djwong@kernel.org,
	linux-nvme@lists.infradead.org, philipp.reisner@linbit.com,
	linux-mm@kvack.org, dm-devel@redhat.com,
	target-devel@vger.kernel.org, alex.shi@linux.alibaba.com,
	hch@lst.de, agk@redhat.com, drbd-dev@lists.linbit.com,
	naohiro.aota@wdc.com, linux-nilfs@vger.kernel.org,
	sagi@grimberg.me, linux-scsi@vger.kernel.org, mark@fasheh.com,
	konrad.wilk@oracle.com, osandov@fb.com, ebiggers@kernel.org,
	xen-devel@lists.xenproject.org, ngupta@vflare.org,
	len.brown@intel.com, linux-pm@vger.kernel.org, hare@suse.de,
	ming.lei@redhat.com, linux-block@vger.kernel.org, tj@kernel.org,
	linux-fscrypt@vger.kernel.org, viro@zeniv.linux.org.uk,
	jefflexu@linux.alibaba.com, jaegeuk@kernel.org,
	jlbec@evilplan.org, konishi.ryusuke@gmail.com,
	bvanassche@acm.org, axboe@kernel.dk, damien.lemoal@wdc.com,
	tytso@mit.edu, akpm@linux-foundation.org,
	martin.petersen@oracle.com, joseph.qi@linux.alibaba.com,
	rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, minchan@kernel.org,
	linux-fsdevel@vger.kernel.org, lars.ellenberg@linbit.com,
	jth@kernel.org, asml.silence@gmail.com,
	ocfs2-devel@oss.oracle.com, roger.pau@citrix.com
Subject: Re: [Drbd-dev] [RFC PATCH 29/34] power/swap: use bio_new in
	hib_submit_io
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5912322698622868088=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com


--===============5912322698622868088==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!
>=20
> diff --git a/kernel/power/swap.c b/kernel/power/swap.c
> index c73f2e295167..e92e36c053a6 100644
> --- a/kernel/power/swap.c
> +++ b/kernel/power/swap.c
> @@ -271,13 +271,12 @@ static int hib_submit_io(int op, int op_flags, pgof=
f_t page_off, void *addr,
>  		struct hib_bio_batch *hb)
>  {
>  	struct page *page =3D virt_to_page(addr);
> +	sector_t sect =3D page_off * (PAGE_SIZE >> 9);
>  	struct bio *bio;
>  	int error =3D 0;
> =20
> -	bio =3D bio_alloc(GFP_NOIO | __GFP_HIGH, 1);
> -	bio->bi_iter.bi_sector =3D page_off * (PAGE_SIZE >> 9);
> -	bio_set_dev(bio, hib_resume_bdev);
> -	bio_set_op_attrs(bio, op, op_flags);
> +	bio =3D bio_new(hib_resume_bdev, sect, op, op_flags, 1,
> +		      GFP_NOIO | __GFP_HIGH);
> =20

C function with 6 arguments... dunno. Old version looks comparable or
even more readable...

Best regards,
							Pavel

--=20
http://www.livejournal.com/~pavelmachek

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmAtkpEACgkQMOfwapXb+vL5ywCguk9XRtMJ4/rJgwKlR42qzH7B
ww4AoK8H3c5uHgpu/eHAUqpvoYMrxHuL
=Rk1V
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--

--===============5912322698622868088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============5912322698622868088==--
