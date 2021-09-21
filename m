Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA30413527
	for <lists+drbd-dev@lfdr.de>; Tue, 21 Sep 2021 16:17:08 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5518C4207AC;
	Tue, 21 Sep 2021 16:17:07 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CE921420621
	for <drbd-dev@lists.linbit.com>; Tue, 21 Sep 2021 16:17:06 +0200 (CEST)
Received: by mail-ed1-f46.google.com with SMTP id c21so73556313edj.0
	for <drbd-dev@lists.linbit.com>; Tue, 21 Sep 2021 07:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cpZ4SsLeLB5kFj7b5RdSAZN38HDux/bGCb7MlAFNqiI=;
	b=FvHT1ZoBzchcm5xO9QIycDWCGvNMcTfImXCtRy3/homyjnLNr8Tn6NYXJv7amiwQiY
	ONxHofNSRlFBUXnm+jt6RZEiJHZrGPWh/nvEKa0OESdW1iGoXRCZsDJKDfDij9bjjppV
	t2suJ6VyEJXOPSqNrk7lM9oB0u7r9JZ4DQhwQIfQrOqi3VHVx6BAEgrcg3ydtfHbrxFX
	ol6kX4CmWD1KKs3qpnpbOcS6uP6DVV7zfGL7GEI8JyKiLXu3QXZ7anTymRtB3z56+e/T
	VetrlZP6D2sAz9B0KnKxmMUuLbIifUHphhypnsxICPgJCZet9DC88T6lsdEAw5u0gimW
	Y3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cpZ4SsLeLB5kFj7b5RdSAZN38HDux/bGCb7MlAFNqiI=;
	b=0qZig+VR73xzGxO44+7zK6l81F9ppTYT+IuuifdtP+K4QnwLo0OOZjAvSLF+ShFl/P
	wMojYaNAUcEqPdjZYts85V16p9WpYnaqRwu0BPgyAdznOwjfnHVxz9pQQA7uUY8zFjdN
	UJSkYovgHWdC3xI+p/plo4i7Xtws146brEYB3nZce8mbz7TKDiCa5MloFdfGuxVZw0YN
	5FKwM4h7bWlUtbUYW3jQuvIGNeMZuNhqTZ/vqfnuC2kJYfK5fOlDWT+J8wJgM+e+W4xX
	67olOsj7G0ftpl2UKY2Jy9nrsGrT41vaLssJnBemYh5ZC8x8XsDCOpL9lzHYXoLr7xq1
	I70Q==
X-Gm-Message-State: AOAM531q9k3DeqEnJz1qeRKJ7mcwfv/+nNAwoLfHuFG0RzZKy88L40dH
	L3IPgEx9V7jUBL+5Hv3XiSITtmxQ/wYzkjigl3FtJOaeto/rQg==
X-Google-Smtp-Source: ABdhPJx4NUf/h9JAkbJbmkrtJc8ZprYUjyLeyHgwvTC0N0kgo0UDo6PCaPxy5UqEJvW2DOrI9yUW8bPllwb1HMat7WY=
X-Received: by 2002:a17:907:2d0b:: with SMTP id
	gs11mr34659568ejc.151.1632233695168; 
	Tue, 21 Sep 2021 07:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAGNP_+VFUJfijkem8TWr1ptkJXbdZryuvbnpLY1GCBgPvKzdzw@mail.gmail.com>
	<20210915110743.1271706-1-rui.xu@easystack.cn>
In-Reply-To: <20210915110743.1271706-1-rui.xu@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Tue, 21 Sep 2021 16:14:44 +0200
Message-ID: <CAGNP_+XVmkZ5jAuh_jpDkdddzNfDNW00cTiUDRgGh9R=7Bv7ng@mail.gmail.com>
To: Rui Xu <rui.xu@easystack.cn>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH v3] drbd: fix a race condition in
	update_sync_bits() and receive_bitmap()
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

Great. Thanks! I'll look into getting this merged.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
