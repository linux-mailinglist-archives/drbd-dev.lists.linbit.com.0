Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F2445DFEB
	for <lists+drbd-dev@lfdr.de>; Thu, 25 Nov 2021 18:41:35 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8E2D14203BF;
	Thu, 25 Nov 2021 18:41:34 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BA5F94201D7
	for <drbd-dev@lists.linbit.com>; Thu, 25 Nov 2021 18:41:32 +0100 (CET)
Received: by mail-ed1-f52.google.com with SMTP id x15so28544720edv.1
	for <drbd-dev@lists.linbit.com>; Thu, 25 Nov 2021 09:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Z2IJ7fkWzT4QzGDzEtLmaHZp2fcDNE6n441j4Jq1TTg=;
	b=h4+g36WEj4z1gI3DDnKk+9MxmbcZ+WG7tK4K27UXXlGc6P83Nt5LvJl0rdPJ41d5+2
	mElVmTmbsyxu+/YXa0m5BLD8hecORHVM0OGuVywAjPtizdkgo/VEYaGsYeQflUwG9z/6
	2a7bFwQq+uAag+i9LUNfT9V0UwMYpb6H6bHjbcY1edN0onoRGksxlvqxikrqLXyDRTip
	5vQ/uTtyej02LeLqTyS/hikgRiDMhAC5sr9KVPS6l13eUbzM/X42nleQAXbraY58C/FR
	9NDnPrkkDp1yVvzXh1497MTnDhkTO9epFf9RMJo6QEWYc+t65IGJisVwk3wplf8L2pKn
	LKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Z2IJ7fkWzT4QzGDzEtLmaHZp2fcDNE6n441j4Jq1TTg=;
	b=8RrnZQR2XKq3lGnbkMJWW2syCGHQt+m8n6CAC9G6Ca5vsR8tyiDU2eJ1OBHmbgFzwD
	5fvY1qc++Z77Kl5mgSDelkavFYBSFkoDvAptk4kjZxPfroD4rguwjHoU//ee97vrGfrq
	EpIuenKirGXZWtoiNrEwJYSTFO0fRExHdSmxoQPLBI9YGipw/v4T66aiTiTc4/f0cj3z
	aam4g9dk9PAuLoodM0VK9F94yHqUDxPNqv4wJvNYhqvcaVpOAw9Vmr/UyVRcPZzeVXej
	7q5te/9E8JiBqIiumcaNhIXtOpJxYJ68x+gx6MsYdBFNOEQ7vGR4dpcRlBQtibbSheFd
	Qxyg==
X-Gm-Message-State: AOAM532vq6RJALwauh3TA16QUeUdi0CZIg2tTGqU23L//wb+AzUmAxTL
	3GBj8FPK3tbanQHsjaX5o0jLY+3B6O67N6AXPXWMi27j
X-Google-Smtp-Source: ABdhPJx2Xczq06usTJYBRLZW2NTpORn5lYS6y+znDW01RIXU6XSiwOXfkyj3NsclbujgsmMU3faOjVf3+64G3yBL76Y=
X-Received: by 2002:a05:6402:147:: with SMTP id
	s7mr41127174edu.8.1637862092248; 
	Thu, 25 Nov 2021 09:41:32 -0800 (PST)
MIME-Version: 1.0
References: <3cbff170-582b-b6cf-0988-e0d0c9b47505@gmail.com>
	<3c0ffc75-0e0f-1701-267b-1bedb6481b79@gmail.com>
In-Reply-To: <3c0ffc75-0e0f-1701-267b-1bedb6481b79@gmail.com>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Thu, 25 Nov 2021 18:41:21 +0100
Message-ID: <CAGNP_+VoB=_c5f6LO_NQBfWLrLa=APR2Ajk+kt0XGWqCMp9EXw@mail.gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] docs: admin-guide/blockdev: Use subgraphs in
	node-states-8.dot
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

Thanks for catching this, Akira.

Unfortunately, this fix causes the "node_states" and "peer_states"
graphs to be mixed up. I guess this happens because the same IDs are
used in each subgraph. The graphs should be separate.

On reflection, the digraph node_states can be removed entirely. It is
too basic to contain any useful information. In addition it references
"ioctl_set_state". The ioctl configuration interface for DRBD has long
been removed. In fact, it was never in the upstream version of DRBD.

Best regards,
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
