Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A084521613
	for <lists+drbd-dev@lfdr.de>; Tue, 10 May 2022 14:55:29 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 43CBA4207B8;
	Tue, 10 May 2022 14:55:28 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E814C420625
	for <drbd-dev@lists.linbit.com>; Tue, 10 May 2022 14:55:26 +0200 (CEST)
Received: by mail-ed1-f51.google.com with SMTP id c12so12422192edv.10
	for <drbd-dev@lists.linbit.com>; Tue, 10 May 2022 05:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qL3WeKUyZpfgitmwO1Zs3a50yg4yCSbE1diGMQX0jD0=;
	b=g5y0s5J7u3Y74lvB0aKRy7gl0J7UQ3pxNClGYdLf6btFnn6MGt+Q2XeGJPlQ2nI0UN
	kS2IPL5eV/M+LsB58rehsNbr00gqALX2gj8LVkzKeqpXRRkBNW+r+9LzNSjIuBK13qX4
	r37UhXeDZJskFeomZQxYILgLDFGBI4FjP89v0alTSidQNG8B27PJPAWAGq8X9O79j3IK
	R8UUCADa2YKzNRPHuOymLWJ7AmxM5NGz2gsXyTvwEQtFBTJXrp9u7r/20765ERFZxLcD
	Zht5CVtjeEob8ZWrYJLrdrht8xQ3wwW3gFhSvJ+lwvuJ85vD2AvNMNy7dDKCLu+cffWg
	KXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qL3WeKUyZpfgitmwO1Zs3a50yg4yCSbE1diGMQX0jD0=;
	b=ACYPD/FVLADDq4+3Xcp31TPZQK19aADLtOS19udPuwothk+MWNS09UTWgRotMAb7iZ
	KwBKLGk73pQpi+8dm9xvd3GGu0nueo/R16gH3DF1Kf1G70c2pa+Iz1Ah46S6fuaZd9Vu
	Qx3V7rf1SOsCPd0RQ/naoSRtAHLkVQDbXJ71qqLLsSkw673C88iud+GWOZ/lt7bcrXNy
	YZYQInLNzWK5Gw8peZZ6NN4qT7695HcsyoQ0X5mJzZyn80nZec4dL1sjg4C03qe5BPJH
	5sgprrHpeINpQZnLq3j2imZQmYJNBGwe8h7nwCb/tYNP0NzjsL9iIm5lvX9RpmWFImuu
	IjTA==
X-Gm-Message-State: AOAM533kiWWmZm2637nPU9Wuvt5kKRlasnn0xsiNDWaAGUv2pc/IxxLj
	hwnHg6lqm/Ty6pfiFUV3/ldkny4qOFOR3DhuuCY0uNGExMORmQ==
X-Google-Smtp-Source: ABdhPJwawyxB4Ssl0/j1foIZGpaLFSlWlOgRvwPsRL+mLWYUIsRN2I3Jpd0oMw3gFK65yo4gJQGwkfZd0XKHhat5uI4=
X-Received: by 2002:a50:eb05:0:b0:428:9cb3:5cb1 with SMTP id
	y5-20020a50eb05000000b004289cb35cb1mr10867646edp.344.1652187326375;
	Tue, 10 May 2022 05:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAGNP_+W2Ys27fco_W6x+UvkUMKva5FpzZEAu4EnhvqM+Bx5NGQ@mail.gmail.com>
	<AJwAbwDZIVuayp7pP6u5v4pq.3.1652184563067.Hmail.rui.xu@easystack.cn>
In-Reply-To: <AJwAbwDZIVuayp7pP6u5v4pq.3.1652184563067.Hmail.rui.xu@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Tue, 10 May 2022 14:55:15 +0200
Message-ID: <CAGNP_+VQDpNfrDgWLDc0F1Va-Fnt5VEAFreXVn7ufiq6R_OJTQ@mail.gmail.com>
To: "rui.xu" <rui.xu@easystack.cn>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] drbd: a proposal of two-primaries mode
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

Hi Xu,

Dual primary mode is not recommended for this scenario due to data
divergence considerations. How do you handle a loss of network
connectivity between the storage nodes?

Is it possible to use diskless DRBD clients instead of iSCSI
initiators for your purposes?

Assuming you have to use iSCSI, the normal solution is to only have
one active target. Use a cluster manager to support failover to the
other storage node. For instance, add a third node with minimal
resources as a diskless tiebreaker, enable DRBD quorum, and use the
drbd-reactor promoter as a simple cluster manager. Have you considered
this option?

Best regards,
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
