Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CD92FE385
	for <lists+drbd-dev@lfdr.de>; Thu, 21 Jan 2021 08:13:13 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 91741420641;
	Thu, 21 Jan 2021 08:13:12 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
	[209.85.218.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E5F6342063D
	for <drbd-dev@lists.linbit.com>; Thu, 21 Jan 2021 04:01:50 +0100 (CET)
Received: by mail-ej1-f49.google.com with SMTP id gx5so558549ejb.7
	for <drbd-dev@lists.linbit.com>; Wed, 20 Jan 2021 19:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YdnR/g1AUsA802dFK4Bs9r1QCNRoeBKoAACTpgBxsAQ=;
	b=S82oKn6Q+hAvCVWp3R9ocfOXM2/txxi1xOjHxUHmByrZ8kBz2L+vdZmpZsEoegtsH7
	kEKPOe4hs5bnGP8bgsWbRPouosUnKNj9uWM25NvOl6npKH6Q3aIq351tyu35oZ16Gcd9
	gI+/RZHwBoUQXrBob5pPzeDFlql7a72PNMpdC/G6NQL7jOeLy08k8OzSFgGhZ/81pKeb
	bfGMAqvNxE6MPJJ+X7pfFTpMlP/b5cWbsk8wBXFKl5pUb3B1PIYLs2reLAOvnsUFUsv7
	f1sf/+zO67e9eDmjS0bptW4tw0r9uzixuWtFOktEToRwo2mwE5lw5fhIJQSO5xGWaVtk
	y6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YdnR/g1AUsA802dFK4Bs9r1QCNRoeBKoAACTpgBxsAQ=;
	b=YF8cgZ8p6X7vk+FfkkFoe0+3zJvYJp+eldj+JN5FSEXZ5Ac+bv/G9FobHWcxkjlfvx
	UMAc/oRJxAL8ntLSphSl+a/+ynp7StXk+nNh21XrBlnsSUeX4EZYIwJxYZtez3gILVCx
	iHGwXIXYiAMaQxY4ylJgiDVZje5VqAAjEy+SjJk/+BpFs8LQuDdhBJedcpxPCKPQN/n6
	yBYAqHkP+4SWRv5EDn7inkAM/fVjG3ZQedZ0zMUfzekDQnaC1OiWZTQNqwie3Q8rukZr
	izD5gahjSnpanJBybznpt57PH2IRvNJMWRY8djYfEyEWZUW4dit6wPMskM5Jl+hJYGxq
	t08w==
X-Gm-Message-State: AOAM533N4T6oLsF5sx1sQAcDfQxyYg+VEZvu3VqncG9Jy4/K0WrBE60K
	2XNcg66lE65AHWkgWL9wzhXRwxa6u8LABbK61p4=
X-Google-Smtp-Source: ABdhPJx4hIKkKiU2iBKXjdqE5eWNNe7e0osIQ9gJJ07rfesCCPovnPnhiYH+s1vpHW57b+spuuKB7GPDWGgtgfAiGN4=
X-Received: by 2002:a17:906:9619:: with SMTP id
	s25mr7999226ejx.345.1611198050485; 
	Wed, 20 Jan 2021 19:00:50 -0800 (PST)
MIME-Version: 1.0
References: <20210119050631.57073-1-chaitanya.kulkarni@wdc.com>
In-Reply-To: <20210119050631.57073-1-chaitanya.kulkarni@wdc.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Thu, 21 Jan 2021 14:00:38 +1100
Message-ID: <CAGRGNgWLspr6M1COgX9cuDDgYdiXvQQjWQb7XYLsmFpfMYt0sA@mail.gmail.com>
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
X-Mailman-Approved-At: Thu, 21 Jan 2021 08:13:11 +0100
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net, snitzer@redhat.com,
	gustavo@embeddedor.com, linux-nvme@lists.infradead.org,
	philipp.reisner@linbit.com, song@kernel.org, dm-devel@redhat.com,
	target-devel@vger.kernel.org, adilger.kernel@dilger.ca,
	Christoph Hellwig <hch@lst.de>, agk@redhat.com,
	drbd-dev@lists.linbit.com, naohiro.aota@wdc.com,
	sagi@grimberg.me, Linux SCSI List <linux-scsi@vger.kernel.org>,
	darrick.wong@oracle.com, osandov@fb.com,
	cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
	kent.overstreet@gmail.com, josef@toxicpanda.com,
	Denis Efremov <efremov@linux.com>, colyli@suse.de,
	linux-raid@vger.kernel.org, rpeterso@redhat.com,
	linux-bcache@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
	dsterba@suse.com, bvanassche@acm.org, agruenba@redhat.com,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	damien.lemoal@wdc.com, tytso@mit.edu,
	"Martin K. Petersen" <martin.petersen@oracle.com>, clm@fb.com,
	LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
	jefflexu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	Tejun Heo <tj@kernel.org>, lars.ellenberg@linbit.com,
	jth@kernel.org, asml.silence@gmail.com, linux-btrfs@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hi Chaitanya,

On Tue, Jan 19, 2021 at 5:01 PM Chaitanya Kulkarni
<chaitanya.kulkarni@wdc.com> wrote:
>
> Hi,
>
> This is a *compile only RFC* which adds a generic helper to initialize
> the various fields of the bio that is repeated all the places in
> file-systems, block layer, and drivers.
>
> The new helper allows callers to initialize various members such as
> bdev, sector, private, end io callback, io priority, and write hints.
>
> The objective of this RFC is to only start a discussion, this it not
> completely tested at all.
> Following diff shows code level benefits of this helper :-
>  38 files changed, 124 insertions(+), 236 deletions(-)

On a more abstract note, I don't think this diffstat is actually
illustrating the benefits of this as much as you think it is.

Yeah, we've reduced the code by 112 lines, but that's barely half the
curn here. It looks, from the diffstat, that you've effectively
reduced 2 lines into 1. That isn't much of a saving.

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
