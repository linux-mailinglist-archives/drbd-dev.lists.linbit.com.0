Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B77904074
	for <lists+drbd-dev@lfdr.de>; Tue, 11 Jun 2024 17:50:11 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 667A142096F;
	Tue, 11 Jun 2024 17:50:06 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 391 seconds by postgrey-1.31 at mail19;
	Tue, 11 Jun 2024 17:50:01 CEST
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C5B4442095E
	for <drbd-dev@lists.linbit.com>; Tue, 11 Jun 2024 17:50:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718121000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=m3mVOlE8X03VcFujwgTUstJqoq0FTNeRmucJ5uXzzb4=;
	b=Z2NZTsDSI5drr3AR7AI9npKfhsoeCGp9jeKvPKa+lyEjZHAPVrTkz4BBimDpl2JPqECwLB
	MkuCRUA1fpc8PCzlyX5l8JG0R4fDPGBYhYgBnb552MvEA43lBaXjNi1bj8U9b9oUVBqYEa
	iDYvGiNRJEvrnxq4jDBgJ++F3KKbUhw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
	(ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
	cipher=TLS_AES_256_GCM_SHA384) id us-mta-541-M7gCHZsfNvaRoPk4wQQxjw-1;
	Tue, 11 Jun 2024 11:43:27 -0400
X-MC-Unique: M7gCHZsfNvaRoPk4wQQxjw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
	(mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
	[10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
	SHA256) (No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with
	ESMTPS id 8414F1956068; Tue, 11 Jun 2024 15:43:15 +0000 (UTC)
Received: from localhost (unknown [10.39.193.36])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with
	ESMTP id DD4331954AC1; Tue, 11 Jun 2024 15:43:10 +0000 (UTC)
Date: Tue, 11 Jun 2024 11:43:09 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 08/26] virtio_blk: remove virtblk_update_cache_mode
Message-ID: <20240611154309.GA371660@fedora.redhat.com>
References: <20240611051929.513387-1-hch@lst.de>
	<20240611051929.513387-9-hch@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RRHJimCDVdpqhQ+7"
Content-Disposition: inline
In-Reply-To: <20240611051929.513387-9-hch@lst.de>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	linux-bcache@vger.kernel.org, Alasdair Kergon <agk@redhat.com>,
	drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev,
	linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Mikulas Patocka <mpatocka@redhat.com>,
	xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org,
	Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>,
	linuxppc-dev@lists.ozlabs.org,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com


--RRHJimCDVdpqhQ+7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 07:19:08AM +0200, Christoph Hellwig wrote:
> virtblk_update_cache_mode boils down to a single call to
> blk_queue_write_cache.  Remove it in preparation for moving the cache
> control flags into the queue_limits.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/virtio_blk.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--RRHJimCDVdpqhQ+7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmZocI0ACgkQnKSrs4Gr
c8gYxQf+MiHN7lIto5cvBArHuLRaYXdHSqN8WkOxjyk6pKDVJN3zByol4IsQ1or0
gi3U/1yXaU1lyM8v76HhRI789ZE9OXHiRD8iKWM54w0uldvJLPNzByqsrvapKvmR
XjYyMxgp/uFJZ4qxg3nonI2Fa2FzSjqA/ct/sTYj8AbXOsOEK/bUZasvnrwUuIhP
FwODujdCtfIpzMvn4c262LUiz3TOY+p3nH/CSKsYZwR5xiUbbZCf30PKrwN4RcmU
ti4hIKoOJcLH5gjgeXpfx7jOM/6Qr7eQrEelsDnuMAKYXC9WMj48+O6Cf8mFja4M
N1txQKX0NepjOjzDmydD5Dx/69S/sg==
=ehtQ
-----END PGP SIGNATURE-----

--RRHJimCDVdpqhQ+7--

