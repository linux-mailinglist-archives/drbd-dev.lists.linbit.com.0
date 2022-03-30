Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 716004EC4F5
	for <lists+drbd-dev@lfdr.de>; Wed, 30 Mar 2022 14:52:21 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4CEDD4205D4;
	Wed, 30 Mar 2022 14:52:20 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4F8ED420128
	for <drbd-dev@lists.linbit.com>; Wed, 30 Mar 2022 14:52:18 +0200 (CEST)
Received: by mail-ed1-f51.google.com with SMTP id g20so24286275edw.6
	for <drbd-dev@lists.linbit.com>; Wed, 30 Mar 2022 05:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YKfuVW491L+tvKTmlfRZE7I/FhThbnEDs1Cysg+20UI=;
	b=amMZKK6HYB4I7Tuv9i53KMrx7RIQvPoMpkAeGBWEbatF2Rs8b59BZOI2DwrBcP5zN4
	u2L5nSQzQwRW6EiD9Vuhb7J/k8t3xOJaCf+QYT+cQs6ElPDI0j24SgtctGOBq2yqj/kC
	NCqOFNCXaCeOzBERqn641cW6TFShE0NV6pYHEOX/amcckbfHjwX8nYvbABY7BtlMvmT5
	wnLbA24LrkfCeJPA+uAGuSYnV0AAVo8WQji/aOruHQgQ8du9/Nv/4cVpPlgzisGMJWox
	ZLq3XlBImyGD7213D+v9GsckSOk5rs1eeihsMxOYLWtYZX5klCKo95cAeqNfcbwIaZ4K
	Zs+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YKfuVW491L+tvKTmlfRZE7I/FhThbnEDs1Cysg+20UI=;
	b=SKma6Jm59pyr3Jsyf50b09tk9HKKaPxQiXaQXqkJfaSbXM/CNzNWMxsZQYNrpHOz1s
	xMiAJQLHiCTjwAeI9lpZsh9D3BcJmSFoYyhmksXrTNfHX1q0O8SBMicsMCO0OTCZ8ZtX
	N6KIT4AXwG4g6ec8Ijh9DkKVDbGJWxS4/QgYXH0HQgCA9Q8BYd11oP9QtmLIBNfxinu4
	hWLIo4jSEGkb6FQAn3voIBs7lhQPpvu+/9tv1dj9UtKQMmGCOFRT4Af0Mf2uzL2qUpuw
	VbhxhfqboKj0fsOpeTJDzXxjw9rQr94+ci3ZXQ96Qh6H7raQ3i7l12qwp2vw3vaWZwBv
	N4Vw==
X-Gm-Message-State: AOAM533ifWjtIbd1imWGEaHd2I9xG7xB5yJi4BK/LSInbqOISK0S+YRx
	UkVAuWgbFv20BcuGblWmey3Sfh6ajoSYfM3Nat5UnPq+u7bt+wmv
X-Google-Smtp-Source: ABdhPJxWYwhr9xQgdbovwriwiQWh8cHU9qfaZG635TA0YsmX+ju+xlz15yneE536e7gYXFQJ3L/ZMX0D1lLLgg/nyL8=
X-Received: by 2002:aa7:c3ce:0:b0:41b:679c:adc3 with SMTP id
	l14-20020aa7c3ce000000b0041b679cadc3mr2280376edr.344.1648644737874;
	Wed, 30 Mar 2022 05:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220302123523.471277-1-rui.xu@easystack.cn>
	<ANUANAAVIdwn*FrX7b*E8aoA.3.1648177379860.Hmail.rui.xu@easystack.cn>
In-Reply-To: <ANUANAAVIdwn*FrX7b*E8aoA.3.1648177379860.Hmail.rui.xu@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Wed, 30 Mar 2022 14:52:07 +0200
Message-ID: <CAGNP_+U9ex9RjftsSFOcXmhTYs4uXGH+OKskLqUjzARozdEc_w@mail.gmail.com>
To: Xu Rui <rui.xu@easystack.cn>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd:do not wait for negotiation result with
	unconnected peer
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

Hi Rui Xu,

Sorry for the slow responses. We do appreciate the contributions and
will review them.

Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
