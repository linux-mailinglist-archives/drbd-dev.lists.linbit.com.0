Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id C3066AAF5DE
	for <lists+drbd-dev@lfdr.de>; Thu,  8 May 2025 10:40:10 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9F2DD16B814;
	Thu,  8 May 2025 10:40:04 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
	[209.85.218.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2EE81160917
	for <drbd-dev@lists.linbit.com>; Thu,  8 May 2025 10:39:59 +0200 (CEST)
Received: by mail-ej1-f46.google.com with SMTP id
	a640c23a62f3a-ac339f53df9so120682966b.1
	for <drbd-dev@lists.linbit.com>; Thu, 08 May 2025 01:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1746693599;
	x=1747298399; darn=lists.linbit.com; 
	h=in-reply-to:content-disposition:mime-version:references
	:mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
	:subject:date:message-id:reply-to;
	bh=tAMMoFnFLjgC9AxWVKUIqDWBuYeiF74xsSdBNFfpxcI=;
	b=oGOglxpmHAPUSX6Q2AyjfKQFztPOOQ9fz/mBhS40M4wAU2+I94jTWV0Sd2L2k+wnTu
	ajLQUcBQCExpV1v5rymVhmE86dfc9jyy1dyojFdeos+fTvEf01Q/sr3Aej5lQeg7Qcaq
	LiItOrPwwGKDs3XhgCSrTICAOqb6HYnJAR/KYAQ5T1Ey2ZX4/WfwZLhj2wOK1CwDnyam
	kgHfAofnhC4YG7mn0Ic0zkZ/7B/hZBrFO06t5s0WZd6TL74MNpoJNibvJQ6yTh6Jcfxm
	wPz4gOFdQUEZir/tR1afCn48TJvm0BJFhoNBrnp1He3haZSjLsySEtdLArV5B4Nmc+YT
	8Alw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1746693599; x=1747298399;
	h=in-reply-to:content-disposition:mime-version:references
	:mail-followup-to:message-id:subject:cc:to:from:date
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=tAMMoFnFLjgC9AxWVKUIqDWBuYeiF74xsSdBNFfpxcI=;
	b=XIzUk9LBuBX2md2duAvNyBmUgLBn2ao42WniGOi1s+w3VRTPrY5jyyo9hTEmSojTO/
	rRMfhmmHATZEs+hWKDeJh9Muhehh4f/bXUhgiR2IrZLNf6RXEBl6/KqW+wV1O6f2IM85
	6I/KPWotEmkCVV079F3V2wTM2Std/W40vmNDFPZJSMCftveep9rHfHgV1oymqVl/1Tlt
	nUzcVb6mCFfthm5HkehkfqG7gpNeDsnNUjyxZxmq/oxr5PtUXXwwvKacy0hlUhcxQh2x
	Rd2TFPNKvjHnCvk41EWfgs9IieDrhmHA/bDwjEaGZVsHE6256EMMppUkR24hlZDV+P7K
	8F1g==
X-Forwarded-Encrypted: i=1;
	AJvYcCU/neqyzlgKjIdmZOWdRpBBddLMiNCEj1IgcpuCMwmEgSNajHfHGFKT+d9YE3CjtS6QFedynX/3Kw==@lists.linbit.com
X-Gm-Message-State: AOJu0YwsBN09PjYemTH4UqcZZYy/S21Gw+F8LjNMRgfLMqemjGVd5upo
	9luZG7XP2Q3uGzGLQuSHcb5171RcIMMw1fwwIdNgtkURboOu1vevaFCdFaGuc4XQGw2w67WifY+
	fkx0=
X-Gm-Gg: ASbGncstpb7Yu+Rj/20BIvhEvekt/6SqnQTVACMgm0AccdrAOYhRSpcug//gTdJ0Cm8
	k3tICiW9tnFkBqxdiKKare81prcJugjuHkxd7qKzQaEUUL6XA5/SHJoF6etWHudjVFgfykDRUdO
	DUR5uaUxwfG/AwGYvv0vPiUnQk4/6gaf8n58dFaaroxjzJ/biom3ptR/xCnIYZAMZHRQQNOmHLD
	oqFaSdXzK0Jb+v0Ber8JrnHEgxk1kJ/z22N6M0ch7Sz/F8SHjzuSUeP8UicSsONwBXZKWmm+DBK
	My57wUVW7pog5F6d+fIMjeTCc7cr8OCHHuqUzP+7GZGyNijYwENe1i25i94Fb8AKUd6g4EgoxVd
	SaL54UvF0740I
X-Google-Smtp-Source: AGHT+IFS5ug7hwtAoPOrOpPdMHvCmuTo+K9+sWESa0b8bvZDBXVxf650X6+wfe/41qLd+PNEDUKe3w==
X-Received: by 2002:a17:907:a08f:b0:acb:34b2:851 with SMTP id
	a640c23a62f3a-ad1e8cd6495mr655012666b.44.1746693599036; 
	Thu, 08 May 2025 01:39:59 -0700 (PDT)
Received: from grappa.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	a640c23a62f3a-ad1e1292696sm402542566b.111.2025.05.08.01.39.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 08 May 2025 01:39:58 -0700 (PDT)
Date: Thu, 8 May 2025 10:39:56 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: transferring bvecs over the network in drbd
Message-ID: <aBxt3NsJcofxhV5P@grappa.linbit>
Mail-Followup-To: Christoph Hellwig <hch@infradead.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?=
	<christoph.boehmwalder@linbit.com>, 
	drbd-dev@lists.linbit.com, linux-block@vger.kernel.org
References: <aBxTHl8UIwr9Ehuv@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBxTHl8UIwr9Ehuv@infradead.org>
Cc: linux-block@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	drbd-dev@lists.linbit.com
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

On Wed, May 07, 2025 at 11:45:50PM -0700, Christoph Hellwig wrote:
> Hi all,
> 
> I recently went over code that directly access the bio_vec bv_page/
> bv_offset members and the code in _drbd_send_bio/_drbd_send_zc_bio
> came to my attention.
> 
> It iterates the bio to kmap all segments, and then either does a
> sock_sendmsg on a newly created kvec iter, or one one a new bvec iter
> for each segment.  The former can't work on highmem systems and both
> versions are rather inefficient.
> 
> What is preventing drbd from doing a single sock_sendmsg with the
> bvec payload?  nvme-tcp (nvme_tcp_init_iter0 is a good example for
> doing that, or the sunrpc svcsock code using it's local bvec list
> (svc_tcp_sendmsg).

For async replication, we want to actually copy data into send buffer,
we cannot have the network stack hold a reference to a page for which
we signalled io completion already.

For sync replication we want to avoid additional data copy if possible,
so try to use "zero copy sendpage".

That's why we have two variants of what looks to be the same thing.

Why we do it that way: probably when we wrote that part,
a better infrastructure was not available, or we were not aware of it.
Thanks for the pointers, we'll look into it.
Using more efficient ways to do stuff sounds good.

    Lars

