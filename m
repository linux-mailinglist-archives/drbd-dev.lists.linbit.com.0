Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C744F586CBC
	for <lists+drbd-dev@lfdr.de>; Mon,  1 Aug 2022 16:22:26 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BFC744207AF;
	Mon,  1 Aug 2022 16:22:24 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
	[209.85.218.53])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5258E4203DF
	for <drbd-dev@lists.linbit.com>; Mon,  1 Aug 2022 16:22:23 +0200 (CEST)
Received: by mail-ej1-f53.google.com with SMTP id i14so1914083ejg.6
	for <drbd-dev@lists.linbit.com>; Mon, 01 Aug 2022 07:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HO7OmUZDF59991CR8Jv6YCPPDz778J0fCPpe9gsdrlE=;
	b=cZBJysihxVOS0/1PvhLasy5yjG7MNqfNkZAPhjkujS7V/jxollek8/8sMtYktfJ3tK
	7633+jSgJUAudXkhAX9cCeaOx6IoOaF7qYQ3athxtf5sXt4NXmHV4pwGQAjGVZpJpSnU
	WT1i4KMD0bdZkFfpgmJUL7uwQGQST0zA80xhQwQcNhOlwZsnjd0QURayJDlSn4jNTTAk
	RxN6RyUJHW6hn9FaOea9uH2MjtFe6utxwtG7Wa1ZI/0Fz65zHxpeV48osg4xNcXiywoY
	EetWYPKnV4VvbzcNgvphj0Lp4rgvMfgv4lQpaHJWI2Damm/S1xPnj+y3c/90lDRXRhyx
	B4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HO7OmUZDF59991CR8Jv6YCPPDz778J0fCPpe9gsdrlE=;
	b=AD9PQS5w2EH45+Y9K5NHH3xjCo0SIY1Ly8wC1z8qvOKKfdgwinwfUob5e5sYlB5isk
	LpfSfOWCu2zpjwrvjSWH6M875wXjwDSfVpy1VI0Ao00S/A+j1cJbpLkZttwl/Em02S0D
	NZtSJLWMcT0PnenncKBAzJj8H0QL8EuotwnPHCug0jLSx78AcYJSfNghH2TtUhF9upt0
	3xOysWA+6gumlq2dBlqVf/gKxpSk+u3bJ8P2dXVVnZeh6BjRCfLVQ/Gm54ZZ+OUBjV4W
	C5hiN8yP8Lxy8/lB1J1ava/RazU7CO0P5Sy+n+0gFX9dgzf6rukAx9YItx5zvpDuS7v9
	oRbg==
X-Gm-Message-State: AJIora+G9D1kvGn0uzJQKsYqaWjE/8EQgcGgRLwC0z3Bj51C04T603BI
	qug4RJFL1T5OjfhXTbD0p1slwHM/QYPAaotR4T1TcRLk
X-Google-Smtp-Source: AGRyM1vkQGR7q2KvT7hP8As8QbzKLmguV3KsnZTU5+016BxLbaTYcGP3D7WdOFJRB/kTdvgs7FTNrpl0PPblGcHGBeA=
X-Received: by 2002:a17:906:7955:b0:72f:97d9:9796 with SMTP id
	l21-20020a170906795500b0072f97d99796mr12866956ejo.436.1659363742872;
	Mon, 01 Aug 2022 07:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220728114759.810371-1-rui.xu@easystack.cn>
In-Reply-To: <20220728114759.810371-1-rui.xu@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Mon, 1 Aug 2022 16:22:12 +0200
Message-ID: <CAGNP_+UM0GR2oukOeN8NoKMka=_Hox4SB9MSBgNPMcOrcYxqXg@mail.gmail.com>
To: Rui Xu <rui.xu@easystack.cn>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: fix a bug with two-primaries
	configuration
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

The behavior that you describe is the intended behavior, I believe. If
you have two primaries and want to disconnect them in a controlled
fashion, you should demote them first.

As discussed previously, you probably should not be using
"allow-two-primaries" at all.

The proposed patch unfortunately also breaks various other usage
scenarios. For instance, if you have two nodes that are both Secondary
and UpToDate, and run 'drbdsetup disconnect', it will cause them to
become Outdated.

Best regards,
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
