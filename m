Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B784CB944
	for <lists+drbd-dev@lfdr.de>; Thu,  3 Mar 2022 09:39:00 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EDF3F42081E;
	Thu,  3 Mar 2022 09:38:58 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9CE064205D8
	for <drbd-dev@lists.linbit.com>; Thu,  3 Mar 2022 09:38:56 +0100 (CET)
Received: by mail-pf1-f182.google.com with SMTP id z15so4168656pfe.7
	for <drbd-dev@lists.linbit.com>; Thu, 03 Mar 2022 00:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SGMF6oSM44wO/3sji0yXCG/PEtOPShxdSQ68WLQRB2g=;
	b=ZvINIOlHF3nZHDcX3MwxAzlzprOUAV7bE6ys/MgPVlfVq9lkuahVjDHsPLQ7QbaFo9
	fQEFqUdMgi81YiKV62ulZnN7ZvbWazV6yRB1Qn/XiuQndMVO9fvHUymuPfTr2Dg+jh50
	vUEnvjC71yyLrdhZGmiVJ4PzTrzLKfXKpEMH9pkW4eVCRVAqTfa9XuvSN7zcx65Vy8CK
	d46NAYhkVq2HOhizng3Ws+JRbkWyYjQl4vq/u0RRAuHhPVUlG5PBN7oH7sIbE0gusQ26
	6C+XTV9PxP4Ds6jAKJQCAmbFUS0yNAc3zTUs7Z/QKxXKC+XQ8KtJ4GqninQZxzg5r19Q
	dsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SGMF6oSM44wO/3sji0yXCG/PEtOPShxdSQ68WLQRB2g=;
	b=ZkXAfs+akBgmurYnxvRGgOGGoaabE22kSuCTI+sBONo0E+PDpsf9mSHcg7N11+45P1
	aAHwSvNzOTrui+9Nkn8XiCaoUfeJ/Xu/eC459pj7IzOq4mBLDJM2m59xHyPYfFh5KINY
	qNGbTwu9+r1HyaxzyHQxjxvso8wz8NPBXedczsixXC8wZnumaS0z9R3qhM4SeWNDAJJ5
	pEuA/hgxoFhTH9pP+5KoWBsVrFaNwCTiBAsAXyKrcBdOIktELin1Rn0a5MwtucOwyTT9
	TLNzof7zXCVQZ1bH6yBOEFerUuDR1H2D6G9D1yF4KGyx47nUNmti5evRNf3FsjNm76O0
	4caA==
X-Gm-Message-State: AOAM5318g8gMIb/vhn5dHYiePpM7mOGmeD7hle7+U9UsFbOsMgClW3LY
	5an2dSz22k3vzYs68HLY3ec=
X-Google-Smtp-Source: ABdhPJxqu7M+1zWgFCPBx1x396RDv729JpxnE5pMePfUDpYTg5HqtDHmeV1ToBxB32C6BUNb5VRxjw==
X-Received: by 2002:a63:f03:0:b0:374:50b5:1432 with SMTP id
	e3-20020a630f03000000b0037450b51432mr28638188pgl.308.1646296735582;
	Thu, 03 Mar 2022 00:38:55 -0800 (PST)
Received: from ubuntu.huawei.com ([119.3.119.19])
	by smtp.googlemail.com with ESMTPSA id
	q92-20020a17090a1b6500b001bc169e26aasm6405436pjq.2.2022.03.03.00.38.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 03 Mar 2022 00:38:54 -0800 (PST)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: xiam0nd.tong@gmail.com
Date: Thu,  3 Mar 2022 16:38:31 +0800
Message-Id: <20220303083831.11833-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303083007.11640-1-xiam0nd.tong@gmail.com>
References: <20220303083007.11640-1-xiam0nd.tong@gmail.com>
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
	christophe.jaillet@wanadoo.fr, jakobkoschel@gmail.com,
	v9fs-developer@lists.sourceforge.net,
	linux-tegra@vger.kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
	nathan@kernel.org, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
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

correct for typo:

-for (struct list_head *list = head->next, cond = (struct list_head *)-1; cond == (struct list_head *)-1; cond = NULL) \
+for (struct list_head *list = head->next, *cond = (struct list_head *)-1; cond == (struct list_head *)-1; cond = NULL) \

--
Xiaomeng Tong
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
