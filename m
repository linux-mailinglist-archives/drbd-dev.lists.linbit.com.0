Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 414BE2FB6D2
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 15:20:50 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 30B6D4207DA;
	Tue, 19 Jan 2021 15:20:49 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 305 seconds by postgrey-1.31 at mail19;
	Tue, 19 Jan 2021 15:20:47 CET
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 42D4B42006E
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 15:20:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611066046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=2ycJhE8mXTZkoJTspQiF4eAdjjIOqaHJTzxw51QUBpw=;
	b=gQCFpDFdkIV2VS5ggXBnts8v5Hicw8V7ey9DUgrUT8ne2AwhTycPmgvMV+bbn6igB4af6F
	/SAXpLM3dJ/tCspblJQ4kRTUjVR7yp0m25Znc9Dq39bs2XjxJtf6E8JnOJfpm/Yr/VLTZ3
	P3ZXgW8GNjSQRbuJFv6EdwjA7jYawvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-504-Na2rrFESP2-59Jhvxs6BgA-1; Tue, 19 Jan 2021 09:14:34 -0500
X-MC-Unique: Na2rrFESP2-59Jhvxs6BgA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9A58806661;
	Tue, 19 Jan 2021 14:14:29 +0000 (UTC)
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AA0D19C47;
	Tue, 19 Jan 2021 14:14:23 +0000 (UTC)
Date: Tue, 19 Jan 2021 09:14:22 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Message-ID: <20210119141422.GA23758@redhat.com>
References: <20210119050631.57073-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210119050631.57073-1-chaitanya.kulkarni@wdc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
	gustavo@embeddedor.com, linux-nvme@lists.infradead.org,
	philipp.reisner@linbit.com, song@kernel.org, dm-devel@redhat.com,
	target-devel@vger.kernel.org, adilger.kernel@dilger.ca,
	hch@lst.de, agk@redhat.com, drbd-dev@lists.linbit.com,
	naohiro.aota@wdc.com, sagi@grimberg.me,
	linux-scsi@vger.kernel.org, darrick.wong@oracle.com,
	osandov@fb.com, cluster-devel@redhat.com,
	linux-ext4@vger.kernel.org, kent.overstreet@gmail.com,
	josef@toxicpanda.com, efremov@linux.com, colyli@suse.de,
	linux-raid@vger.kernel.org, rpeterso@redhat.com,
	linux-bcache@vger.kernel.org, viro@zeniv.linux.org.uk,
	dsterba@suse.com, bvanassche@acm.org, agruenba@redhat.com,
	axboe@kernel.dk, linux-block@vger.kernel.org,
	damien.lemoal@wdc.com, tytso@mit.edu, martin.petersen@oracle.com,
	clm@fb.com, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, jefflexu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, tj@kernel.org,
	lars.ellenberg@linbit.com, jth@kernel.org,
	asml.silence@gmail.com, linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [RFC PATCH 00/37] block: introduce bio_init_fields()
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Tue, Jan 19 2021 at 12:05am -0500,
Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com> wrote:

> Hi,
> =

> This is a *compile only RFC* which adds a generic helper to initialize
> the various fields of the bio that is repeated all the places in
> file-systems, block layer, and drivers.
> =

> The new helper allows callers to initialize various members such as
> bdev, sector, private, end io callback, io priority, and write hints.
> =

> The objective of this RFC is to only start a discussion, this it not =

> completely tested at all. =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
> Following diff shows code level benefits of this helper :-
> =C2=A038 files changed, 124 insertions(+), 236 deletions(-)


Please no... this is just obfuscation.

Adding yet another field to set would create a cascade of churn
throughout kernel (and invariably many callers won't need the new field
initialized, so you keep passing 0 for more and more fields).

Nacked-by: Mike Snitzer <snitzer@redhat.com>

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
