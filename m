Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C733FD5C3
	for <lists+drbd-dev@lfdr.de>; Wed,  1 Sep 2021 10:40:45 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E7EA842061C;
	Wed,  1 Sep 2021 10:40:44 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
	[209.85.208.44])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3F81D420603
	for <drbd-dev@lists.linbit.com>; Wed,  1 Sep 2021 10:40:44 +0200 (CEST)
Received: by mail-ed1-f44.google.com with SMTP id q17so2703867edv.2
	for <drbd-dev@lists.linbit.com>; Wed, 01 Sep 2021 01:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Oi+1B0eCQJIW/XnVzSLCbaoYzp8qhTbzbUs0z98MR7k=;
	b=0VmwUXWY5yvzw8qQ1aJm3YYaW92ZJdhbkP5zp0dhMhI8DoN1R8PQVv1CSfiZx1LANQ
	uZfmBXcB5H10Jdv+xNjggxrjczEVcZkIhENJ3Qe127l0PVPbQ1u7uhvI4jH0C+0SD0Vp
	EOOqqEjYJTS7x0RVX2sjEuXdHIH5Aqs1+UVxTV5yozGM/LfQ32HfG5ak5mLbPLD0EXFp
	8e61AqGvf99J5jZPN/d6u5KKwhRbLS0y9SJ12MPD7rR2PaEGOJkMpISKSpB2Axd0ahBp
	sP6AtcRpY0p7vKVFvxpi+a0uMwlz3DrjbFq5JgVXg25zJTpTHuJ/RDx0wwlJLr4QOE/R
	JeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Oi+1B0eCQJIW/XnVzSLCbaoYzp8qhTbzbUs0z98MR7k=;
	b=dlshb2YFBhisbyu0kBeywBJuMf/baMBv+ZGqu72yOCsJCOvQ7VTu0KIDoDWkyxYECt
	w+59dfXg/sI8AI/jClrdXyaznnUKJycmeHNlptTr5phvDBu9/FXqnJVx1nHTEY47cCB8
	+55Hp5ju7gGiqI3wYrWYPx6WvGEA34rMTAIAqp6CbFlsyQ5cmzyMWqOYCUmenJFkvDGE
	SmXZy/MZeKtTRdRFAr6FceSBSxg6I079fFodiu8ESCG51luiD8aL00Ugb+TnHzFcvUDW
	p6H5PtgJNEEmTfEgqDlrELoP8GjHa73BrgQmeJknUgZUoLoFXXsZ/M1A2um1xFOmeQcw
	dHVg==
X-Gm-Message-State: AOAM531Tfe8Ydd7jS9GZdS0bqIdzwuGTmMNpXrodU0YwsOonoRvoDBgE
	eX/CyjcIveYnKQG3Pzfc+yNlZgAXQES10dHSuhdgGYIp
X-Google-Smtp-Source: ABdhPJzFoF0B/WwQIkhxHVawlQoclObEQDuM8yNoxb76mf/SziAxJVXG+Q/hh4lwiDGFbgFOs0+01+/nImij/7QIdK8=
X-Received: by 2002:aa7:d986:: with SMTP id u6mr10730423eds.156.1630485643775; 
	Wed, 01 Sep 2021 01:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210901023826.838222-1-rui.xu@easystack.cn>
In-Reply-To: <20210901023826.838222-1-rui.xu@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Wed, 1 Sep 2021 10:40:32 +0200
Message-ID: <CAGNP_+U3-BZ+9uykZuttOp6+irG15yesyFfDs27kj3M6BJN+1A@mail.gmail.com>
To: Rui Xu <rui.xu@easystack.cn>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: do not finish the stable resync when
 repl state is L_PAUSED_SYNC_T
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

Hi,

Thanks for the contribution. Please describe the steps necessary to
reproduce the issue. I tried briefly to reproduce it without success;
getting a paused sync to finish before a running one is not that easy.
A test in https://github.com/LINBIT/drbd9-tests would be ideal, but a
written description is OK too.

Please also verify that the issue occurs on the latest drbd-9.0 or
master branch. I see from the patch that you are working on a version
that is at least a couple of months old.

Best regards,
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
