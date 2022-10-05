Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 800875F5225
	for <lists+drbd-dev@lfdr.de>; Wed,  5 Oct 2022 12:01:54 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E9EF2421743;
	Wed,  5 Oct 2022 12:01:53 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 351 seconds by postgrey-1.31 at mail19;
	Wed, 05 Oct 2022 09:00:52 CEST
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
	[64.147.123.24])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C24A9421779
	for <drbd-dev@lists.linbit.com>; Wed,  5 Oct 2022 09:00:52 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id D46F0320076F;
	Wed,  5 Oct 2022 02:54:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute3.internal (MEProxy); Wed, 05 Oct 2022 02:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664952897; x=1665039297; bh=jWTbZEvbtDtUpxhiaZ06jnKvT3cn
	t7nqR4YpnsdkpzA=; b=SN/B0rG//lwD0KUvExQeYgJmksgAuQTF3wbAMmkGYXw3
	tZDKhTSS0NxHUE/2Ljh3UjN1jVph4YVJNCa9EyI/k+wCFbArqwmSL7zuVXxEQvVi
	6BPctFK77GjmQwtk7oq5brX7C5oEDNKcjOhZ9omGjQffozknm0uLJGdA4Fpdc7+O
	td/p/33vN73l6G+g+1yZFfNlltEjDxBu5iRaz3KGHmhuUr8DVu9+eCj+6q9Y6g0N
	bDThAyvejofXn+tgNSPzqEjKpJejXW+D3uwo7Vp/M0MzzbGCxv99heIGcWEy5h2e
	glwIRnUzWyrOrshKeBlmMc/oubA/jYjr3y0mYPtyBw==
X-ME-Sender: <xms:Pyo9Y-Z4elN1Fe-Y2a5I_7wiI1rJYJUeIV3kNVkTTPhKeH1M5-vPwA>
	<xme:Pyo9YxY6wsMwCvFZLEPMRTXWojebDd1jhl7SQ-HfGakBHmmHIsBNCAM-QrjpNjlJS
	n9MLkASF-3dEhhAaTM>
X-ME-Received: <xmr:Pyo9Y4_XinFLEkKFqDfQkTqCnLPHtdInd6PX18SGuRvpMOawyGQ2i1yV8sHJ5MZSR1n_u-QBPC6BRl6VXUlKQWb6Xi9zpoLZ0dI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeivddguddufecutefuodetggdotefrod
	ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
	necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
	enucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhn
	ucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrf
	grthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedv
	ueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
	epfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:Pyo9YwqufxSZDLDkbx2_7_1aZI-PfVYfpBiX7qPsQYDRbF_Jstl4cg>
	<xmx:Pyo9Y5raNcqnWsqJdZpmQ_zJHhy3BoEiCgTYwzJt6WITb3rLAO3Alg>
	<xmx:Pyo9Y-QLMw58FfnDEeWlso5eW8V76Z0BdIwklzwU6U93vzJi8AlyUw>
	<xmx:QSo9Y_gAkX9CqBZ8zI3KIJAa8a0fZKASrx12ssz77auJ4vxMMkXv0Q>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
	5 Oct 2022 02:54:53 -0400 (EDT)
Date: Wed, 5 Oct 2022 17:54:48 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Chaitanya Kulkarni <kch@nvidia.com>
In-Reply-To: <20221005050027.39591-16-kch@nvidia.com>
Message-ID: <78eb3d46-de71-a20c-ed5a-efc6ce71f571@linux-m68k.org>
References: <20221005050027.39591-1-kch@nvidia.com>
	<20221005050027.39591-16-kch@nvidia.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Oct 2022 12:01:52 +0200
Cc: vincent.fu@samsung.com, vigneshr@ti.com, philipp.reisner@linbit.com,
	haris.iqbal@ionos.com, miquel.raynal@bootlin.com,
	jinpu.wang@ionos.com, tim@cyberelk.net,
	drbd-dev@lists.linbit.com, bvanassche@acm.org, richard@nod.at,
	damien.lemoal@opensource.wdc.com, geert@linux-m68k.org,
	shinichiro.kawasaki@wdc.com, josef@toxicpanda.com,
	efremov@linux.com, nbd@other.debian.org,
	linux-block@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	hare@suse.de, ming.lei@redhat.com, axboe@kernel.dk,
	johannes.thumshirn@wdc.com, linux-kernel@vger.kernel.org,
	mcgrof@kernel.org, linux-mtd@lists.infradead.org, lars.ellenberg@linbit.com
Subject: Re: [Drbd-dev] [RFC PATCH 15/18] swim: use init disk helper
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Tue, 4 Oct 2022, Chaitanya Kulkarni wrote:

> Add and use the helper to initialize the common fields of struct gendisk
> such as major, first_minor, minors, disk_name, private_data, and ops.
> This initialization is spread all over the block drivers. This avoids
> code repetation of inialization code of gendisk in current block drivers
> and any future ones.
> 
> Signed-off-by: Chaitanya Kulkarni <kch@nvidia.com>
> ---
>  drivers/block/swim.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/block/swim.c b/drivers/block/swim.c
> index 42b4b6828690..7fa4b2766367 100644
> --- a/drivers/block/swim.c
> +++ b/drivers/block/swim.c
> @@ -835,15 +835,12 @@ static int swim_floppy_init(struct swim_priv *swd)
>  
>  	for (drive = 0; drive < swd->floppy_count; drive++) {
>  		swd->unit[drive].disk->flags = GENHD_FL_REMOVABLE;
> -		swd->unit[drive].disk->major = FLOPPY_MAJOR;
> -		swd->unit[drive].disk->first_minor = drive;
> -		swd->unit[drive].disk->minors = 1;
>  		sprintf(swd->unit[drive].disk->disk_name, "fd%d", drive);
> -		swd->unit[drive].disk->fops = &floppy_fops;
>  		swd->unit[drive].disk->flags |= GENHD_FL_NO_PART;
>  		swd->unit[drive].disk->events = DISK_EVENT_MEDIA_CHANGE;
>  		swd->unit[drive].disk->private_data = &swd->unit[drive];
> -		set_capacity(swd->unit[drive].disk, 2880);
> +		init_disk(swd->unit[drive].disk, FLOPPY_MAJOR, drive, 1, 2880,
> +				&swd->unit[drive], &floopy_dops);
>  		err = add_disk(swd->unit[drive].disk);
>  		if (err)
>  			goto exit_put_disks;
> 

You typo'd the ops struct. By inspection, I'd say your patches 11/18 and 
16/18 will not compile either.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
