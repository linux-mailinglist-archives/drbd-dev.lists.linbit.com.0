Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id C96B6AA95C3
	for <lists+drbd-dev@lfdr.de>; Mon,  5 May 2025 16:26:39 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6A62416B811;
	Mon,  5 May 2025 16:26:34 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7E62A160645
	for <drbd-dev@lists.linbit.com>; Mon,  5 May 2025 16:26:25 +0200 (CEST)
Received: by mail-wm1-f46.google.com with SMTP id
	5b1f17b1804b1-43cfba466b2so36871365e9.3
	for <drbd-dev@lists.linbit.com>; Mon, 05 May 2025 07:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1746455185;
	x=1747059985; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=JDYATAnhW6J+cGti3RbsBPryXSyPudaSTlpZQmcK2NU=;
	b=d2j+Kl+ufbYobFDGJ2iw8FankkC7ZWMqHYQgQauayADd8/tUXUqDljFsaoOklNcx24
	XqmT+IpnIt1een+a8GMTNgCtEc2/TzzJyvgfXV/V/+CAwZJfvoDFBlQi+A/Li52RRUwr
	adJHOOPGTUbfY/T2hohLhVOkmGTyzO0cbJlwnZhvdbqEqxKpKl2AnNDkRCT0dwVrsaWs
	sMb+8JIO8BS6UqDDJojW37tiJkERCVBuw26HXHy3Ismk/RVLEPzwdeV2gjRA+cjDHgxQ
	LewNr1L40iaN/bSja1X4V52yePEdFtlSoIvus0+4rOqO3ZTk7R9MK5O0ggVbmWn4ITUU
	R13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1746455185; x=1747059985;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=JDYATAnhW6J+cGti3RbsBPryXSyPudaSTlpZQmcK2NU=;
	b=wohnL7rh6eTs3HvLVn2Lp8OLYsGI18hkfHg3/5DogruKQmPczrU25g9FIOlHSZlENH
	XS3rMO8P77jSC8lHgMBf5sqk5kziXWKrFLkcR5GXo9Ab6SHhFKX9q/ZVnSWTDxoBRove
	/uLYUiD7EkcmglTUuf4AARBylrbkwZKxtJYOtf8zwkS7pcl2InpKYhDzemnSHGaiZ2zg
	0xM1PxkgvhUVqL28bKnNTSK5IgAuq8H1CQG5hFWxWcZ1bpykE+FKsNV4w1B1KOIBQC4+
	JyJCzcdNiOjtQS7HL5oEOYnSHGwQ7oq8v2CiU2OAlV3WglveQYs+JUFsNrq4FBuyalEF
	vHpg==
X-Gm-Message-State: AOJu0YwYcKf1QzO4VQCbdbf70capyk6S3rYNf0PfnCCB6BkbyIhkd8Rv
	qqzsc91brbiuZoCWZbi68BEpzuFH7ZttN4zduHh0KMQGWeoPuvT85IyS1FaJR+emcfX2jDioBcj
	75GI=
X-Gm-Gg: ASbGncttiUe7mdSzWijc/X8yIoouRWHJi97gsDMLtdmXLI+A5BTaiwUFmsxR+fLzvpo
	IiBHZmR1cXEHEGHFI1Mty16OCWnTufnZ1GD4aVqbMd83QOTc+pEDikz+vnV35Q9Fhv3FqxlBjfK
	oy+qOcgw98cC3uhK2LwyXE6whZHMn4+dCh4iVTIYBlfP3zps3wA5tV9K50OMUziZkFgyf9d/QLq
	kjtnEjCfCqVdidFpuzoWMTHiU8H+ttk+OGc5saaQNa4OTlOcBpwuRZKvtbhsMpej+2PVsYNjc0A
	2ksJYRY3W2p70RsQF4TdMiDGDQ4Aj8m1V47cycUsM2XUDpQadE/nxYSieHVe4dgPjZCAbTAZ2Eo
	ndWgQYMVN7zNmiXRCY+HADcvvu64=
X-Google-Smtp-Source: AGHT+IGRRHvFzC1pTfuzWT2rwyBd1TZjqSL6zkf788egSo0/aLeKXbOESfju7taQpBb9WWIIHalM6w==
X-Received: by 2002:a05:600c:b90:b0:43c:fffc:7855 with SMTP id
	5b1f17b1804b1-441c48d58ebmr72756175e9.15.1746455185163; 
	Mon, 05 May 2025 07:26:25 -0700 (PDT)
Received: from ryzen9.home (192-164-20-231.hdsl.highway.telekom.at.
	[192.164.20.231]) by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-441b89ee3a9sm134115385e9.23.2025.05.05.07.26.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 05 May 2025 07:26:24 -0700 (PDT)
From: Philipp Reisner <philipp.reisner@linbit.com>
To: "zhengbing . huang" <zhengbing.huang@easystack.cn>
Subject: Re: [PATCH] rdma: Fix cm leak
Date: Mon,  5 May 2025 16:26:22 +0200
Message-ID: <20250505142623.424049-1-philipp.reisner@linbit.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425102421.1673048-1-zhengbing.huang@easystack.cn>
References: <20250425102421.1673048-1-zhengbing.huang@easystack.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: drbd-dev@lists.linbit.com
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

Hi Zhengbing,

Yes, I agree. I follow your explanation of what happened and your
proposed fix. I think we also need to clear the DSB_CONNECT_REQ bit in
the RDMA_CM_EVENT_ESTABLISHED case.

Please see my proposal, which is slightly modified from your original
patch.

Best regards,
 Philipp

zhengbing.huang (1):
  rdma: Fix cm leak

 drbd/drbd_transport_rdma.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

-- 
2.49.0

