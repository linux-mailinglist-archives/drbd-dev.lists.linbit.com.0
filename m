Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C91A2CD9C79
	for <lists+drbd-dev@lfdr.de>; Tue, 23 Dec 2025 16:31:52 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 947D016319B;
	Tue, 23 Dec 2025 16:31:40 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
	[209.85.218.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E85F41608F4
	for <drbd-dev@lists.linbit.com>; Tue, 23 Dec 2025 16:31:34 +0100 (CET)
Received: by mail-ej1-f41.google.com with SMTP id
	a640c23a62f3a-b728a43e410so937917766b.1
	for <drbd-dev@lists.linbit.com>; Tue, 23 Dec 2025 07:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1766503894;
	x=1767108694; darn=lists.linbit.com; 
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:from:to:cc:subject:date:message-id:reply-to;
	bh=OKp3I1hXZ5oaW9OCweI535ARQcis3FpYNYo3tmtgSjk=;
	b=Q1G7xBfbmcqab+DS9iacGNW4RVRAstTkjgTHEaGEJjtqcapFSOwy9+7YE8uxGdjR6R
	5eGKHD+BCsIkfMej1UXieZn/VfxOVGe+LHuRaW5sFKVctz7OoM9LvLMjvRqPe+pKo5oT
	bpiJ6ORgLmkaEHcApkSljVGDQUwVMAR1BSKZ7gzuTCm8d2owzWdyzjhRsbpKM2ERWDKQ
	KPBObpUdz1MR8hfNMXl+EOByQX8TowWfRkwlZAjtpD6gIKCS2dvU9a3ujPd7qp3ntxjE
	+OLkPcLa6x1075M2Cy73CsrmRvJzWkQK6VJM5o2hwjfzVIuRtLut2x9JApsiFxvEhHpD
	5TnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1766503894; x=1767108694;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=OKp3I1hXZ5oaW9OCweI535ARQcis3FpYNYo3tmtgSjk=;
	b=Ni3zC4DJ8PsfDFGJY99RIblN9vmUsgC5iqQuNMnyuDMYon35J1CLQEgzhT2DGDzT24
	/CnReBFcbWZfyOLmjRI7WmCtruTt7hiaZ6LBf2VS0xkoeBTvpkdJRVV3HjtUTkO2CE5O
	1GjhCWE3i/B7VWnrkSKwYNjmsmKLuzTGyqpSb0b1DM1JeQriUrSmUa0BpBcXkTRgHx4k
	1QdMQwbd/05pwkHQPIIJuMeNJ9T9VEpfaXmBtUU1Xz1SY/mj/Oijb//7z5O+CijA3P79
	G7oPJyXZItcvtrbB7EQ9bGV4HR2UadBNBG3Yi3kWlKEoH5o4n1/cuMJwKIsBpM4aSMpE
	Eg+A==
X-Gm-Message-State: AOJu0Yxt/eguS8u9XoxviW1Va0XVyZoFlkK5aozs6t2YG1ix9QL2sQtX
	7Lkk85KNHm5xNZ/AEsoDF2jcPpalQ12D5W6NXjKxr1jU3J7GTzZ8CCdjhqbF5eic1J0NL1UlN8v
	Lpt4Y8fvrTUibXei48yYyQE+MIydTK0auR0ghgnJwuhEkdURuzuwDev8=
X-Gm-Gg: AY/fxX7a0UihQhEz75ka/93I8TCoQvyt4DRey5Q4gQ0aOOO2U/bxXVzFCk5GfW/byyw
	fMhPDppeK1WfkpiL1dcTsryKYsbnOCgGPxnPNUQ3ERVKqEdbptX9VDlUT+4Qqoz/WqMMjPcY1h6
	D8JnrtIOXV3QQNEFYVz4u6UnJqaVhkXmqywIVxdsEWRoWtuwPtJ16obLA8NvCjuWnby/826YL9y
	XCklbTcASqguffDyHiiuDb4dtx/JQz8rilDN7HizN+HKb+1Xwhf/+JJxXAhKopNrdAjI+w=
X-Google-Smtp-Source: AGHT+IHFE+CR1YIYjfxp9dVwk0BW1Zn6lvF5jhyDtQtpcOOQrG/kGDGSz4VFewO8BKNpPZPm2zP48TZE9W/Mqi+MZw4=
X-Received: by 2002:a17:907:3f28:b0:b7a:1bde:a01d with SMTP id
	a640c23a62f3a-b8037228e19mr1476340566b.65.1766503893629;
	Tue, 23 Dec 2025 07:31:33 -0800 (PST)
MIME-Version: 1.0
References: <20251223110818.589784-1-zhengbing.huang@easystack.cn>
In-Reply-To: <20251223110818.589784-1-zhengbing.huang@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Tue, 23 Dec 2025 16:31:21 +0100
X-Gm-Features: AQt7F2oT_riKZ_6TkZQ7thj2vnz2PfgnbhbyLID8XVssVkhlczt_9gTIvSr0HUE
Message-ID: <CAGNP_+Ww8pnUGDCKaWSOjTsFkngnRcSvEwVdchyFGyB9QPE0jg@mail.gmail.com>
Subject: Re: [PATCH v3] drbd: Send P_PEERS_IN_SYNC only within the resync
	range in resync progress
To: "zhengbing.huang" <zhengbing.huang@easystack.cn>
Content-Type: text/plain; charset="UTF-8"
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

Thanks for the updated patch! I will take a look after the Christmas
break. You can expect a response by mid-January.

Joel
