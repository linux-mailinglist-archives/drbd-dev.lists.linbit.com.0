Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0BC4CB8D1
	for <lists+drbd-dev@lfdr.de>; Thu,  3 Mar 2022 09:30:39 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2297C4205EC;
	Thu,  3 Mar 2022 09:30:38 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1B35C420372
	for <drbd-dev@lists.linbit.com>; Thu,  3 Mar 2022 09:30:35 +0100 (CET)
Received: by mail-pg1-f194.google.com with SMTP id 132so3904337pga.5
	for <drbd-dev@lists.linbit.com>; Thu, 03 Mar 2022 00:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uLpTC29O7sSEzWIyhD1PQNyRAs1/upRhzEEBO0P7TrY=;
	b=R05ZV01Yp+GvJafCjJwp2DdNQL1X7N4+v2qDpWCUjxekJqjhV8nKttt+lgDdDv8VHZ
	pTpad4a62LLA8SjB/yHHEpNTxY0U28zfBa611uCN9ihzVETreTphlyPy+ETyTE4AgOSy
	RSp6pqcLA1mQfW+JjTEEtr3nMT+EN3gAPPB7pPpCIhAgeloFO+Vkph8Zctn11Qajj/U0
	QUVjSv6dTXzOO7akWefQCdrhFJznQKo01Wl+2crhxprXX9zSh/gHLWP/Xe3lMKAcW1nu
	BI3FrzUOW0QskfQ+hVH91vnr00ExY+gCD8VtMWG6RhFXS05x/6dGZMaR1NPNguf29zlo
	qAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uLpTC29O7sSEzWIyhD1PQNyRAs1/upRhzEEBO0P7TrY=;
	b=uc143iWG4rO8bbDWXcqj9qUi70HPvsR6Lbg5bkjQMxK4si7OHhpk0/JM3euWt0ut9L
	5LDqEPxy+DVx0i0m1sswYW2Cz3shJus0HaxQ6MHIAygjRWucMaJqndjq5dCNtBD5UhJP
	CFaqEKNgECS0Je1/dxMYxm5UCRQVKstACcgRZpsmx4QHOxZEDqZRTTNayg3fLNI43HVI
	eia7ZYZ94xCfYgbeJgP2tFspLhB7sScW0HsGhg6OxKfqVjWY2BbCuYxKQ86bSQoOb3Ms
	ODDIARChk2xwFvZJuj1Xv1iTh1Wdl0ghWzFC48wTqgaW3C4m3fTqY/+dTE+RkbyM76zM
	IFOg==
X-Gm-Message-State: AOAM530aPdZQbGi9KIg7yqa6fad0qNgBoO7TnC9POESPRqa+F3+jYi/2
	gGcYg5ZJPP24aTaPLAEnIsc=
X-Google-Smtp-Source: ABdhPJxl3tqNmXwEb6Rf4RyrJiQAiYb1f64m7AmzgvvLqhkGp3dQvJbj8a24YWybBg5gGNAc3KtcpA==
X-Received: by 2002:a63:8bca:0:b0:370:2717:3756 with SMTP id
	j193-20020a638bca000000b0037027173756mr29011952pge.604.1646296234811;
	Thu, 03 Mar 2022 00:30:34 -0800 (PST)
Received: from ubuntu.huawei.com ([119.3.119.19])
	by smtp.googlemail.com with ESMTPSA id
	d5-20020a17090acd0500b001b9c05b075dsm7342532pju.44.2022.03.03.00.30.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 03 Mar 2022 00:30:34 -0800 (PST)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: jakobkoschel@gmail.com
Date: Thu,  3 Mar 2022 16:30:07 +0800
Message-Id: <20220303083007.11640-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <A568BD90-FE81-4740-B1D3-C795EB636A5A@gmail.com>
References: <A568BD90-FE81-4740-B1D3-C795EB636A5A@gmail.com>
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org, gustavo@embeddedor.com,
	linux-iio@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
	linux@rasmusvillemoes.dk, dri-devel@lists.freedesktop.org,
	c.giuffrida@vu.nl, David.Laight@ACULAB.COM,
	amd-gfx@lists.freedesktop.org, torvalds@linux-foundation.org,
	samba-technical@lists.samba.org,
	linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
	linux-arch@vger.kernel.org, linux-cifs@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-scsi@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev,
	h.j.bos@vu.nl, jgg@ziepe.ca, intel-wired-lan@lists.osuosl.org,
	nouveau@lists.freedesktop.org,
	bcm-kernel-feedback-list@broadcom.com, dan.carpenter@oracle.com,
	linux-media@vger.kernel.org, keescook@chromium.org,
	arnd@arndb.de, linux-pm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, bjohannesmeyer@gmail.com,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	christophe.jaillet@wanadoo.fr, v9fs-developer@lists.sourceforge.net,
	linux-tegra@vger.kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
	nathan@kernel.org, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, xiam0nd.tong@gmail.com,
	tipc-discussion@lists.sourceforge.net,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mediatek@lists.infradead.org, akpm@linux-foundation.org,
	linuxppc-dev@lists.ozlabs.org, christian.koenig@amd.com, rppt@kernel.org
Subject: Re: [Drbd-dev] [PATCH 2/6] treewide: remove using list iterator
	after loop body as a ptr
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

> I think this would make sense, it would mean you only assign the containing
> element on valid elements.
>
> I was thinking something along the lines of:
>
> #define list_for_each_entry(pos, head, member)					\
>	for (struct list_head *list = head->next, typeof(pos) pos;	\
>	     list == head ? 0 : (( pos = list_entry(pos, list, member), 1));	\
>	     list = list->next)
>
> Although the initialization block of the for loop is not valid C, I'm
> not sure there is any way to declare two variables of a different type
> in the initialization part of the loop.

It can be done using a *nested loop*, like this:

#define list_for_each_entry(pos, head, member)					\
	for (struct list_head *list = head->next, cond = (struct list_head *)-1; cond == (struct list_head *)-1; cond = NULL) \
	  for (typeof(pos) pos;	\
	     list == head ? 0 : (( pos = list_entry(pos, list, member), 1));	\
	     list = list->next)

>
> I believe all this does is get rid of the &pos->member == (head) check
> to terminate the list.

Indeed, although the original way is harmless.

> It alone will not fix any of the other issues that using the iterator
> variable after the loop currently has.

Yes, but I stick with the list_for_each_entry_inside(pos, type, head, member)
way to make the iterator invisiable outside the loop (before and after the loop).
It is maintainable longer-term than "type(pos) pos" one and perfect.
see my explain:
https://lore.kernel.org/lkml/20220302093106.8402-1-xiam0nd.tong@gmail.com/
and list_for_each_entry_inside(pos, type, head, member) patch here:
https://lore.kernel.org/lkml/20220301075839.4156-3-xiam0nd.tong@gmail.com/

--
Xiaomeng Tong
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
